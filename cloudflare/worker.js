import './wasm_exec.js'

import WASM from './go-bingai-pass.wasm'

const fCF = async (req) => {
  const go = new Go();

  const instance = await WebAssembly.instantiate(WASM, go.importObject);
  go.run(instance, {});

  let res = await new Promise((resolve, reject) => {
    let res = fuckCF(
      req.IG || '',
      req.cookies || '',
      req.iframeid || '',
      req.convId || '',
      req.rid || '',
      req.T || '',
      req.host || '',
      (result) => {
        resolve(result)
      }
    )
    if (res != '' && res != null && res != undefined) {
      reject(res)
    }
  })
  res = JSON.parse(res)
  return Response.json({
    result: {
      cookies: res.cookies,
    },
    error: res.err
  })
}

const getTokenRequest = async () => {
  const go = new Go();

  const instance = await WebAssembly.instantiate(WASM, go.importObject);
  go.run(instance, {});

  let res = await new Promise((resolve, reject) => {
    let res = getToken()
    resolve(res)
  })
  return new Response(res, {
    headers: {
      'Content-Type': 'application/json'
    }
  })
}

export default {
  async fetch(request, env, ctx) {
    const currentUrl = new URL(request.url);

    if (currentUrl.pathname == '/gettoken') {
      return getTokenRequest()
    }

    if (request.method != 'POST') {
      return Response.json({ code: 405, message: 'Method Not Allowed', data: null }, { status: 405 });
    }

    const req = await request.json();
    return fCF(req);
  },
};