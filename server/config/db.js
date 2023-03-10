const mongoose = require("mongoose")


const connectDatabase = () => {
    mongoose.set("strictQuery", false);
mongoose.connect(process.env.MONGO_URI,{
    useNewUrlParser: true,
    useUnifiedTopology: true,
}).then(()=>{
    console.log('database connected ')
}).catch(error=>{
    console.log(error)
})

}

module.exports = connectDatabase
