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

app.get('/getProfesores',(req,res)=>{
  let sql='select * from profesores';
  db.query(sql,(err,result)=>{
    if(err) console.log(err);
    res.send(result);
  })
})

app.get('/getPreceptores',(req,res)=>{
  let sql='select * from preceptores';
  db.query(sql,(err,result)=>{
    if(err) console.log(err);
    res.send(result);
  })
})

app.get('/getMaterias',(req,res)=>{
  let sql='select * from materias ';
  db.query(sql,(err,result,fields)=>{
    if(err) throw err;
    //console.log(result);
    res.send(result);
  })
});


app.get('/getMateria/:id',(req,res)=>{
  let sql =`select * from materias where id = ${req.params.id}`;
  db.query(sql,(err,result)=>{
    if(err) throw err;
    //console.log(result);
    res.send(result);
  })
});

app.get('/getCursos',(req,res)=>{
  let sql=`select * from cursos`;
  db.query(sql,(err,result)=>{
    if(err) console.log(err);
    res.send(result);
  })
})


app.get('/getCursoMat/:id',(req,res)=>{
  let sql=`SELECT cursos.id,cursos.nombre FROM cursos INNER JOIN cursohasmaterias ON cursohasmaterias.curso_fk = cursos.id INNER JOIN materias ON cursohasmaterias.materia_fk = materias.id where materias.id =${req.params.id}`;
  db.query(sql,(err,result,fields)=>{
    if(err) throw err;
    //console.log(result);
    res.send(result);
  })
});


app.get('/getNotas/:alum/:mat',(req,res)=>{
  let sql=`select * from notas where materia_fk=${req.params.mat} and alumno_fk=${req.params.alum}`;
  db.query(sql,(err,result)=>{
    if(err) console.log(err);
    //console.log(result);
    res.send(result);
  })
})

app.get('/getAlumnosCur/:curso',(req,res)=>{
  let sql=`select * from alumnos where curso_fk=${req.params.curso}`;
  db.query(sql,(err,result,fields)=>{
    if(err) console.log(err);
    console.log(sql);
    res.send(result);
  })
});

app.get('/getMateriasProf/:prof',(req,res)=>{
  let sql=`SELECT materias.id, materias.nombre FROM materias INNER JOIN materia_has_profe ON materia_has_profe.materia_fk = materias.id INNER JOIN profesores ON profesores.id = materia_has_profe.profe_fk where profesores.id=${req.params.prof}`;
  db.query(sql,(err,result)=>{
    if(err) console.log(err);
    res.send(result);
  })
})

////////////////POST//////////////////
app.post('/postMateria',(req,res)=>{
  let sql="insert into materias set ?"
  db.query(sql,req.body,(err,result)=>{
    if(err) console.log(err);
    res.send(result);
  })

})

app.post('postProfesor',(req,res)=>{
  let sql='select * from profesores';
  db.query(sql,req.body,(err,result)=>{
    if(err) console.log(err);
    res.send(result);
  })
})

app.post('postPreceptor',(req,res)=>{
  let sql='insert into preceptores set ?'
  db.query(sql,req.body,(err,result)=>{
    if(err) console.log(err);
    res.send(result);
  })

})

app.post('/postAlumno',(req,res)=>{
  let sql='insert into alumnos set ?';
  db.query(sql,req.body,(err,result)=>{
    if(err) console.log(err);
    res.send(result);
  })
})

app.post('/postCurso',(req,res)=>{
  let sql='insert into cursos set ?';
  let query=db.query(sql,req.body,(err,result)=>{
    if(err) console.log(err);
    res.send(result);
  })
})

app.post('/postNota',(req,res)=>{
  let sql=`insert into notas set ?`;
  let query= db.query(sql,req.body,(err,result)=>{
    if(err)console.log(err);
    //console.log(req.body);
    res.send(result);
  })
})


app.listen('3000',()=>{
  console.log('server started on port 3000');
});


