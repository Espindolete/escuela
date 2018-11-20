const cors = require('cors');
const express = require('express');
const mysql = require('mysql');

const app=express();
var bodyParser=require('body-parser');
var multer = require('multer'); // v1.0.5

app.use(bodyParser.json())
app.use(cors())

//creando coneccion
const db =mysql.createConnection({
  host     :'localhost',
  user     :'root',
  password :'root',
  database :'escuela'
});

db.connect((err)=>{
  if(err){
    console.log(err);
  }
  console.log('MySql Connected...');
});


//ready
app.get('/getMateria/:id',(req,res)=>{
  let sql =`select * from materias where id = ${req.params.id}`;
  db.query(sql,(err,result)=>{
    if(err) throw err;
    //console.log(result);
    res.send(result);
  })
});

//ready
app.get('/getMaterias',(req,res)=>{
  let sql='select * from materias ';
  db.query(sql,(err,result,fields)=>{
    if(err) throw err;
    //console.log(result);
    res.send(result);
  })
});

//ready
app.get('/getCursoMat/:id',(req,res)=>{
  let sql=`select * from cursos where ${req.params.id} in (M1,M2)`;
  db.query(sql,(err,result,fields)=>{
    if(err) throw err;
    //console.log(result);
    res.send(result);
  })
});

//ready
app.post('/postNota',(req,res)=>{
  req
  let sql=`insert into notas set ?`
  let query= db.query(sql,req.body,(err,resul)=>{
    if(err)console.log(err);
    //console.log(req.body);
    res.send("funco");
  })
})



app.get('/getNotas/:alum/:mat',(req,res)=>{
  let sql=`select * from notas where materia_fk=${req.params.mat} and alumno_fk=${req.params.alum}`;
  db.query(sql,(err,result)=>{
    if(err) console.log(err);
    //console.log(result);
    res.send(result);
  })
})

//ready
app.get('/getAlumnosMat/:curso',(req,res)=>{
  let sql=`select * from alumnos where curso_fk=${req.params.curso}`;
  db.query(sql,(err,result,fields)=>{
    if(err) throw err;
    //console.log(result);
    res.send(result);
  })
});


app.listen('3000',()=>{
  console.log('server started on port 3000');
});


