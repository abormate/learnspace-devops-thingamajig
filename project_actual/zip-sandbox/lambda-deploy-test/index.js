exports.handler = async (event) => {
     return {
         statusCode: 200,
         body: JSON.stringify('Hello Zip, from Lambda!'),
     };
 };
