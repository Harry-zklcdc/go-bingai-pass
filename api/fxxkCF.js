import './wasm_exec.js'
import { join } from 'path'
import { readFileSync } from 'fs'

const WASM_BYTES = readFileSync(join(process.cwd(), './api/go-bingai-pass.wasm'))

const fCF = async (req) => {
  const go = new Go();

  const WASM = await WebAssembly.compile(WASM_BYTES)
  const instance = await WebAssembly.instantiate(WASM, go.importObject);
  go.run(instance, {});

  let res = await new Promise(async(resolve, reject) => {
    await fuckCF(
      req.IG || '',
      req.cookies || '',
      req.iframeid || '',
      req.convId || '',
      req.rid || '',
      req.T || '',
      req.host || '',
      async (result) => {
        console.log('result', result)
        if (result == '' || result == null || result == undefined) {
          reject('')
        }
        resolve(result)
      }
    )
  })
  res = JSON.parse(res)
  return {
    result: {
      cookies: res.cookies,
    },
    error: res.err
  }
}

export default async function Handler(request, response) {
  if (request.method != 'POST') {
    return response.status(405).json({ code: 405, message: 'Method Not Allowed', data: null });
  }

  return response.status(200).json(await fCF(request.body));
}