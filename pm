#!/usr/bin/env node
const fs = require("fs/promises");
const { spawn } = require("child_process");
const args = process.argv.slice(2);

const argMapping = {
  s: "start",
  d: "dev",
  b: "build",
  i: "install",
  t: "test",
};

(async () => {
  const files = await fs.readdir(process.cwd());

  let nodePackageManager = "npm";

  if (files.includes("yarn.lock")) {
    nodePackageManager = "yarn";
  }
  if (files.includes("pnpm-lock.yaml")) {
    nodePackageManager = "pnpm";
  }

  const [command, ...restArgs] = args;
  const mappedCommand = argMapping[command];
  const parameter = [];

  if (mappedCommand) {
    if ((mappedCommand !== "start" || mappedCommand !== "install") && nodePackageManager === "npm") {
      parameter.push("run");
    }
    parameter.push(mappedCommand);
  }

  parameter.push(...restArgs);

  const cmd = spawn(nodePackageManager, parameter, { encoding: "utf-8", env: { ...process.env, FORCE_COLOR: 1 } });
  cmd.stdout.pipe(process.stdout);
  cmd.stderr.pipe(process.stderr);
})();
