<h1 align="center">
  Docker container with tools
</h1>
<p align="center">Create a new test-ready container with <b>reverse-proxy</b> (Traefik), <b>tunelling</b> (Ngrok),<br/> and <b>email testing</b> (MailHog) by running a few CLI commands.

## 🐳 Docker-way to ⚡️ Quick start

First, [download](https://docs.docker.com/engine/install/) and install the **Docker Engine**. Version `4.9.1` is recommended.

Installation is done by downloading this repo with the **[`git clone`](https://git-scm.com/docs/git-clone)** command in terminal:

```bash
git clone https://github.com/SalimAtMollie/docker-tools tools
```

Let's enter that new downloaded project via the **cd** command:

```bash
cd tools
```

Next, we will run the command which will use the **[`docker-compose`](https://docs.docker.com/compose/)** file to set up the containers needed for the website. If you're ready, we can **start the installation** with:

```bash
docker-compose up --build
```

That's all you need to do to start! 🎉

## ⚙️ Testing

When a container is launched, it also launches a service that performs tests to ensure that the services within the container are properly configured. This is done by executing a series of commands, which will indicate whether the service is functioning correctly. For instance, in the case of the Mailhog service, there is a shell script that is run within a testing container to send an email to an external container, serving as a verification of its proper operation. <b>Pay attention to the output in the terminal to see if the tests have passed or not!</b>

## ⛓️ Links

If you have not changed the variable `PROJECT_BASE_URL` in the .env file. then these are the links which you can use to access the services.

| Service | Use                                              | address   | Type |
|--------|----------------------------------------------------------|--------|---------|
| `Traefik`   | Reverse Proxy dashboard. | `traefik.my.mollie.localhost` | Web UI |
| `Mailhog`   | Test emails dashboard. | `mailhog.my.mollie.localhost` | Web UI |
| `Mailhog`   | Send your test emails to this SMTP server. | `mailhog:1025` | SMTP |
