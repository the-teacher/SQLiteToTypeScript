const toPascalCase = (str) => {
  return str
    .split("_")
    .map((word) => word.charAt(0).toUpperCase() + word.slice(1))
    .join("");
};

const generateTypeDefinitions = (schema) => {
  const typeDefinitions = Object.entries(schema).map(([tableName, columns]) => {
    const typeName = `${toPascalCase(tableName)}Type`;

    const fields = Object.entries(columns)
      .map(([columnName, columnType]) => {
        const formattedColumnName = columnName.endsWith("?")
          ? columnName
          : `${columnName}`;
        return `  ${formattedColumnName}: ${columnType};`;
      })
      .join("\n");
    return `export type ${typeName} = {\n${fields}\n};`;
  });

  return typeDefinitions.join("\n\n");
};

module.exports = generateTypeDefinitions;
