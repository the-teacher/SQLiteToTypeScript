const fs = require("fs");
const path = require("path");
const { Parser } = require("node-sql-parser");

const extractSchema = require("./src/extractSchema");
const mapToTypeScriptTypes = require("./src/mapToTypeScriptTypes");
const generateTypeDefinitions = require("./src/generateTypeDefinitions");

const schemaPath = path.resolve(__dirname, "../data/schema.sql");
const schemaSQL = fs.readFileSync(schemaPath, "utf8");

const parser = new Parser();

try {
  const parsedSchema = parser.astify(schemaSQL);

  console.log(
    generateTypeDefinitions(mapToTypeScriptTypes(extractSchema(parsedSchema)))
  );
} catch (error) {
  console.error("Error parsing SQL schema:", error.message);
}
