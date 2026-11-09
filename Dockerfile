FROM node:20-alpine

RUN apk add --no-cache unzip && corepack enable
COPY Bando-Pirates-CSS-Source-v0.1.zip /tmp/bando.zip
RUN unzip -q /tmp/bando.zip -d /app && rm /tmp/bando.zip

WORKDIR /app/Bando-Pirates-CSS
RUN pnpm install --frozen-lockfile && pnpm --filter @cocoworking/client build

ENV NODE_ENV=production
ENV PORT=3000
EXPOSE 3000
CMD ["pnpm", "--filter", "@cocoworking/server", "start"]
