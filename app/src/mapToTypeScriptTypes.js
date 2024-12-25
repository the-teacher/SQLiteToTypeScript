const sqlToTsType = {
  INTEGER: "number",
  TEXT: "string",
  BOOLEAN: "boolean",
  NUMERIC: "number",
  DATETIME: "Date",
};

const convertToTypeScriptTypes = (schema) => {
  const result = {};

  for (const tableName in schema) {
    result[tableName] = {};

    for (const columnName in schema[tableName]) {
      const sqlType = schema[tableName][columnName];
      const tsType = sqlToTsType[sqlType] || "unknown";
      result[tableName][columnName] = tsType;
    }
  }

  return result;
};

module.exports = convertToTypeScriptTypes;
