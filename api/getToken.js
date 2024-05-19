import './wasm_exec_token.js'
import WASM from './go-bingai-pass.wasm?module'

export const config = {
  runtime: 'edge',
};

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

export function GET(request) {
    return getTokenRequest();
}

export function POST(request) {
    return getTokenRequest();
}