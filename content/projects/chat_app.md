---
title: Simple Realtime chat app
type: page
---

### A Simple realtime chat-app with Elixir Pheonix and LiveView

An realtime chat apps created is by T3 stack (Pheonix LiveView , Postgres , Fly.io)

A simple real-time chat app with Pheonix LiveView, and because of the nature of bi-direction communication, Capability with LiveView only takes me a couple of hours to hack this out, so I did not set up WebSocket at first as LiveView is updating the dom through web socket and the server processes everything including the dom update.

![app_screenshot](/images/invoice_app_screenshot.png)

[:rocket: Demo Site](https://jy-chat-app.fly.dev/)

[:octopus: Github Repo](https://github.com/jyooi/elixir_pheonix_live_view_chat_app)