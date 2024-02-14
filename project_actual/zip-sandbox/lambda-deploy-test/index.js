exports.handler = async (event) => {
     return {
         statusCode: 200,
         body: JSON.stringify('Hello there Zip, from Lambda!'),
     };
 };
