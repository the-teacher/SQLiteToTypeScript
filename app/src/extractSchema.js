const extractSchema = (schema) => {
  const tables = {};

  schema.forEach((tableDefinition) => {
    const tableName = tableDefinition.table[0].table;
    const columns = {};

    tableDefinition.create_definitions.forEach((definition) => {
      if (definition.resource === "column") {
        const columnName = definition.column.column;
        const columnType = definition.definition.dataType;

        const isNotNull =
          definition.nullable?.type === "not null" || !!definition.primary_key;

        const formattedColumnName = isNotNull ? columnName : `${columnName}?`;
        columns[formattedColumnName] = columnType;
      }
    });

    tables[tableName] = columns;
  });

  return tables;
};

module.exports = extractSchema;
