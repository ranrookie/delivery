 Delivery（外卖系统）

面向中小餐饮商家的在线外卖平台，提供从菜品管理到订单履约的全流程解决方案。后端基于 Spring Boot 构建，前端使用 Vue + TypeScript 打包为静态资源，并通过 Docker Compose 一键部署 MySQL、rabbitMQ、Redis、后端服务和 Nginx 前端。

## 功能概览

| 角色   | 功能                                                         |
| ------ | ------------------------------------------------------------ |
| 管理端 | 员工管理、分类/菜品/套餐维护、门店营业状态配置、订单处理、运营数据报表、WebSocket 实时推送 |
| 用户端 | 微信登录、菜品浏览、购物车、地址簿、提交/取消/再来一单、订单历史与状态查询 |

## 技术栈

- **后端**：Spring Boot、Spring MVC、Spring StateMachine、MyBatis、rabbitMQ、Redis、JWT、Ali OSS、WeChat API  
- **前端**：Vue 3 + TypeScript（已编译为静态资源）、PWA、Nginx  
- **基础设施**：MySQL、Redis、Docker & Docker Compose、rabbitMQ
- **其它**：WebSocket 实时通信、定时任务、分层/模块化设计（`sky-common` / `sky-pojo` / `sky-server`）

## 目录结构

- backend/ # 后端源码与 Dockerfile
- ├─ sky-common/ # 公共工具、异常、通用返回封装
- ├─ sky-pojo/ # 实体、DTO、VO
- └─ sky-server/ # Spring Boot 主应用（API、业务、配置、任务等）
- frontend/ # Nginx 及静态前端资源
- mysql/ # MySQL 容器与初始化脚本
- redis/ # Redis 容器
- compose.yaml # 开发环境：MySQL + Redis
- compose.prod.yaml # 生产环境：后端 + 前端 + MySQL + Redis
- .env.example # 环境变量示例

## 亮点特性

- **状态机驱动的订单流程**：`OrderStateMachineConfig` 定义 PENDING → CONFIRMED → DELIVERY → COMPLETED 等状态及事件。
- **定时任务自动化**：`OrderTask` 定时取消超时未支付/未接单订单，并模拟订单自动完成。
- **Redis 缓存与延迟队列**：菜品缓存失效机制、`order:delay:queue` 实现订单到期自动处理。
- **rabbitMQ异步处理订单状态**：订单下单，取消，完成等，利用MQ异步进行，增加并发能力。
- **WebSocket 实时推送**：`WebSocketServer` 群发订单状态变化信息。
- **AOP 元数据填充**：`AutoFillAspect` 自动维护创建/更新时间及操作人。
- **安全认证**：基于 JWT 的用户/管理员双拦截器；秘钥、数据库等均通过 `.env` 注入。

## 快速开始

1. **准备环境变量**

   ```bash
   cp .env.example .env
   # 根据实际环境填写 MySQL、Redis、阿里云 OSS、微信等配置
开发环境（仅数据库与缓存）

bash
复制代码
docker compose up -d
生产/完整环境

bash
复制代码
docker compose -f compose.yaml -f compose.prod.yaml up -d
访问 http://localhost（前端）与 http://localhost:8080（后端 API）。

数据库初始化
mysql/init.sql 包含完整的表结构与示例数据。容器首次启动时会自动导入。

联系方式
Author: shr888666

如果对项目有任何疑问或建议，欢迎在 Issue 中交流。

