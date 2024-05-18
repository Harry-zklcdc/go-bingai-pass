# Go BingAI Pass

## 一键部署

> ### Cloudflare Worker 部署
>
> [![Deploy to Cloudflare Workers](https://deploy.workers.cloudflare.com/button)](https://deploy.workers.cloudflare.com/?url=https://github.com/Harry-zklcdc/go-bingai-pass)

## 环境变量

- `PORT`：API端口号，默认为 `80`
- `HTTP_PROXY`、`HTTPS_PROXY`: 代理服务器地址, 格式: `http://127.0.0.1:18080`
- `BROWSER_BINARY`: 浏览器二进制文件路径, 默认自动下载
- `PASS_TIMEOUT`: 通过人机验证前等待时间
- `PASS_WAIT_TIME`: 通过人机验证后等待时间


## 免责声明

> 本项目所有功能仅供学习和娱乐交流使用，不代表微软的官方观点或立场。本项目不对任何由使用本项目产生的直接或间接损失负责，包括但不限于数据丢失、系统损坏、法律风险等。本项目不保证本站点的功能完整性、稳定性、安全性和准确性，也不保证本项目与微软 New Bing 的一致性。本项目不对本站点的内容进行审核或监督，用户应自行承担使用本站点的风险和责任。本项目保留随时修改或终止本站点的权利，恕不另行通知。

> All function in this project just for learning and entertainment purposes only, and does not represent the official views or positions of Microsoft. This project is not responsible for any direct or indirect losses caused by using this site, including but not limited to data loss, system damage, legal risks, etc. This project does not guarantee the functionality, stability, security and accuracy of this site, nor does it guarantee the consistency of this site with Microsoft New Bing. This project does not review or supervise the content of this site, and users should bear the risks and responsibilities of using this site. This project reserves the right to modify or terminate this site at any time without prior notice.