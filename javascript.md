# Javascript

## Writing to a JSON file

[Source](https://medium.com/@osiolabs/read-write-json-files-with-node-js-92d03cc82824)

to read:

```javascript
const fs = require("fs");
fs.readFile("./customer.json", "utf8", (err, jsonString) => {
    if (err) {
        console.log("File read failed:", err);
        return;
    }
    console.log("File data:", jsonString);
});
```

to write:

```javascript
const fs = require('fs')const customer = {
    name: "Newbie Co.",
    order_count: 0,
    address: "Po Box City",
}
const jsonString = JSON.stringify(customer)fs.writeFile('./newCustomer.json', jsonString, err => {
    if (err) {
        console.log('Error writing file', err)
    } else {
        console.log('Successfully wrote file')
    }
})
```

## Write a Javascript Array to a CSV file

A code snippet that I put together using the CSV library in node:

```js
import stringify from "csv-stringify/lib/sync";

const writeArraysToCsv = (path, array) => {
    const csvString = stringify(array);

    fs.writeFile(path, csvString, (err) => {
        if (err) {
            debug("Error writing file", err);
        } else {
            debug("Successfully wrote file");
        }
    });
};
```
