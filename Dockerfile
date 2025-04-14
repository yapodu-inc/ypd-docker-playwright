# NOTE: https://playwright.dev/docs/docker
# -noble で ubuntu 24.04 上で playwright が使える　
FROM mcr.microsoft.com/playwright:v1.51.1-noble
# -jammy で ubuntu 22.04 で playwright が使える
#FROM mcr.microsoft.com/playwright/python:v1.51.1-jammy

WORKDIR /var/scenario

RUN npm install -g @playwright/mcp@0.0.10
RUN npx playwright install chrome && npx playwright install-deps chrome

COPY ./scenario/entrypoint.sh /var/scenario/entrypoint.sh
RUN chmod +x /var/scenario/entrypoint.sh
ENTRYPOINT ["/var/scenario/entrypoint.sh"]
