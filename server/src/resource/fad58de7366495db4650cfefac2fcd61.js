
let fs = require("fs")
let path = './ssr';
let index = 1;
let newConfig = fs.readFileSync('./new.txt','utf8');
console.log(newConfig);
fs.readdir(path,(err,files)=>{
    files.forEach((fileName)=>{
        fs.writeFile(path+'/'+fileName,newConfig,(err)=>{
            if(!err){
                console.log(index++);
            }
        })
    })
})
