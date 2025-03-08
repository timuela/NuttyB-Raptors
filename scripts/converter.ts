import base64url from 'base64url'
import path from 'path'
import { promises as fs } from 'fs'
const clipboardy = import('clipboardy')

const luamin = require('luamin')
const luafmt = require('lua-format')

const defaultTweakResult = { tweakKey: '', tweakValue: '', isChanged: false }

async function base64ToLua() {
  const base64Dir = path.join(__dirname, '../base64url')
  const luaDir = path.join(__dirname, '../lua')

  await fs.mkdir(luaDir, { recursive: true })

  return processDirectory(base64Dir, luaDir, 'lua', base64UrlFileToLua)
}

async function luaToBase64() {
  const luaDir = path.join(__dirname, '../lua')
  const base64Dir = path.join(__dirname, '../base64url')

  await fs.mkdir(base64Dir, { recursive: true })

  return processDirectory(luaDir, base64Dir, 'base64url', luaFileToBase64Url)
}

type tweakResult = { tweakKey: string; tweakValue: string, isChanged: boolean }

async function processDirectory(
  srcDir: string,
  destDir: string,
  toFileExtension: string,
  convertFunction: (
    srcPath: string,
    destPath: string,
    tweakKey: string,
  ) => Promise<tweakResult>,
) {
  // Ensure destination directory exists
  await fs.mkdir(destDir, { recursive: true }).catch(() => {});

  const entries = await fs.readdir(srcDir, { withFileTypes: true });

  console.log(
    `Processing ${entries.length} entries from ${srcDir} to ${destDir}...`,
  );

  let conversions: Promise<tweakResult>[] = [];

  for (const entry of entries) {
    const srcPath = path.join(srcDir, entry.name);

    if (entry.isDirectory()) {
      // Create corresponding directory in destination
      const nestedDestDir = path.join(destDir, entry.name);
      await fs.mkdir(nestedDestDir, { recursive: true }).catch(() => {});

      // Use the directory name as the tweakKey for all files in this directory
      const tweakKey = entry.name;

      // Process files in this subdirectory
      const subEntries = await fs.readdir(srcPath, { withFileTypes: true });
      for (const subEntry of subEntries) {
        if (!subEntry.isDirectory()) { // Only process files, not nested directories
          const subSrcPath = path.join(srcPath, subEntry.name);
          const destBaseFileName = subEntry.name.split('.').slice(0, -1).join('.');
          const subDestPath = path.join(
            nestedDestDir,
            `${destBaseFileName}.${toFileExtension}`,
          );

          conversions.push(
            convertFunction(subSrcPath, subDestPath, tweakKey),
          );
        }
      }
    } else {
      // Process file in the root directory
      const destBaseFileName = entry.name.split('.').slice(0, -1).join('.');
      const destPath = path.join(
        destDir,
        `${destBaseFileName}.${toFileExtension}`,
      );

      conversions.push(
        convertFunction(srcPath, destPath, entry.name.split('.')[0]),
      );
    }
  }

  return Promise.all(conversions);
}

async function base64UrlFileToLua(
  srcPath: string,
  destPath: string,
  tweakKey: string,
): Promise<tweakResult> {
  try {

    const srcContent = (await fs.readFile(srcPath, 'utf-8')).trim()
    if (!srcContent)
      return Promise.resolve(defaultTweakResult)

    const decoded =
      (destPath.includes('units') ? 'return ' : '') + base64url.decode(srcContent)
    let tweakValue = luafmt
      .Beautify(decoded, {
        RenameVariables: false,
        RenameGlobals: false,
        SolveMath: false,
      })
      .replace(/^[\s\S]*?\]\]\s*/, '')
      .replace(/;\s*\n/g, '\n')
      .replace(/"/g, "'")

    tweakValue += tweakValue.endsWith('\n') ? '' : '\n'

    const destContent = await fs.readFile(destPath, 'utf-8')

    return fs
      .writeFile(destPath, tweakValue, 'utf-8')
      .then(() => {
        return {
          tweakKey,
          tweakValue,
          isChanged: destContent !== tweakValue
        }
      })
      .catch((err) => {
        console.error(err)
        return {
          tweakKey,
          tweakValue,
          isChanged: true
        }
      })
  }
  catch (err) {
    console.error(err)
    return defaultTweakResult
  }
}

async function luaFileToBase64Url(
  srcPath: string,
  destPath: string,
  tweakKey: string,
) {
  const content = (await fs.readFile(srcPath, 'utf-8')).trim()
  if (!content)
    return Promise.resolve(defaultTweakResult)

  const firstLine = content.split('\n')[0];
  const tweakComment = /^\s*--.*/.test(firstLine) ? firstLine+'\n' : '';

  let minified
  try {
  minified = tweakComment + (destPath.includes('units')
    ? luamin.minify(content).replace(/.*?(\{.*)/, '$1')
    : luamin.minify(content))
  } catch (err) {
    console.log(srcPath, 'content:', content.slice(0, 200), '...');
    console.error(err)
    throw err
  }

  console.log('asdfsdf1123')
  const destContent = await fs.readFile(destPath, 'utf-8').catch(() => null);

  console.log('asdfsdf')

  const tweakValue = base64url.encode(minified)

  return fs
    .writeFile(destPath, tweakValue, 'utf-8')
    .then(() => {
      return {
        tweakKey,
        tweakValue: tweakValue,
        isChanged: destContent !== tweakValue
      }
    })
    .catch((err) => {
      console.error(err)
      return {
        tweakKey,
        tweakValue,
        isChanged: true
      }
    })
}

async function main() {
  if (process.argv.length <= 2) {
    console.error('Usage: ts-node converter.ts ')
    return
  }
  if (process.argv[2] === 'b64tolua') {
    await base64ToLua()
  } else if (process.argv[2] === 'luatob64') {
    (await clipboardy).default.writeSync(
      [...(await luaToBase64()).values()]
        .filter(({ isChanged }) => isChanged)
        .map(({ tweakKey, tweakValue }) => `!bset ${tweakKey} ${tweakValue}`)
        .join('\n')
    );
  } else {
    console.error('Usage: ts-node ./scripts/converter.ts b64tolua|luatob64')
  }
}

main()
