import base64url from 'base64url'
import path from 'path'
import { promises as fs } from 'fs'
const clipboardy = import('clipboardy')

const luamin = require('luamin')
const luafmt = require('lua-format')

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

type tweakResult = { tweakKey: string; tweakValue: string }

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
  const files = await fs.readdir(srcDir, { withFileTypes: true })

  let conversions: Promise<{ [key: string]: string }>[] = []
  for (const file of files) {
    const srcPath = path.join(srcDir, file.name)
    const destBaseFileName = file.name.split('.').slice(0, -1).join('.')
    const destPath = path.join(
      destDir,
      `${destBaseFileName}.${toFileExtension}`,
    )

    conversions.push(
      convertFunction(srcPath, destPath, file.name.split('.')[0]),
    )
  }

  return Promise.all(conversions)
}

async function base64UrlFileToLua(
  srcPath: string,
  destPath: string,
  tweakKey: string,
): Promise<tweakResult> {
  const content = (await fs.readFile(srcPath, 'utf-8')).trim()
  if (!content)
    return Promise.resolve({
      tweakKey,
      tweakValue: '',
    })

  const decoded =
    (destPath.includes('units') ? 'return ' : '') + base64url.decode(content)
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

  return fs
    .writeFile(destPath, tweakValue, 'utf-8')
    .then(() => {
      return {
        tweakKey,
        tweakValue,
      }
    })
    .catch((err) => {
      console.error(err)
      return {
        tweakKey,
        tweakValue,
      }
    })
}

async function luaFileToBase64Url(
  srcPath: string,
  destPath: string,
  tweakKey: string,
) {
  const content = (await fs.readFile(srcPath, 'utf-8')).trim()
  if (!content)
    return Promise.resolve({
      tweakKey,
      tweakValue: '',
    })

  const firstLine = content.split('\n')[0];
  const tweakComment = /^\s*--.*/.test(firstLine) ? firstLine+'\n' : '';

  const minified = tweakComment + (destPath.includes('units')
    ? luamin.minify(content).replace(/.*?(\{.*)/, '$1')
    : luamin.minify(content))

  const tweakValue = base64url.encode(minified)

  return fs
    .writeFile(destPath, tweakValue, 'utf-8')
    .then(() => {
      return {
        tweakKey,
        tweakValue: tweakValue,
      }
    })
    .catch((err) => {
      console.error(err)
      return {
        tweakKey,
        tweakValue,
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
    ;(await clipboardy).default.writeSync(
      [...(await luaToBase64()).values()]
        .map(({ tweakKey, tweakValue }) => `!bset ${tweakKey} ${tweakValue}`)
        .join('\n'),
    )
  } else {
    console.error('Usage: ts-node ./scripts/converter.ts b64tolua|luatob64')
  }
}

main()
