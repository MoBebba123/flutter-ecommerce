const express = require("express");

const connectDatabase = require("./config/db");
const adminRouter = require("./routes/admin");
const authRouter = require("./routes/auth");
const productRouter = require("./routes/product");
const userRouter = require("./routes/user");
// Config
if (process.env.NODE_ENV !== "PRODUCTION") {
    require("dotenv").config({ path:  __dirname +"/config/config.env" });
  }
  
const PORT = process.env.PORT;
const app = express();
app.use(express.json());
app.use(authRouter);
app.use(adminRouter);
app.use(productRouter);
app.use(userRouter);

connectDatabase();

app.listen(PORT,()=>{
    console.log(`server is running on port ${PORT}`)
})


