function autorun() {
      var app = new Vue({
        el: '#app',
        data() {
          return {
          	mostrar : null,
            profesores: [],
            preceptores : [],
            buscador : {
                userabuscar : '',
                passabuscar : '',
                profesorencontrado : null,
                preceptorencontrado : null,
            }
          }
        },
        beforeCreate() {
          axios.get('http://localhost/ejemplo/api/api.php/profesores')
            .then(response => {
              this.profesores = response.data;
              console.log("profesores cargados")
            })

          axios.get('http://localhost/ejemplo/api/api.php/preceptores')
          .then(response => {
            this.preceptores = response.data;
            console.log("preceptores cargados")
          })
            .catch(error => { console.log(error) });
        },
        methods: {
          buscarProfes() {
            this.buscador.profesorencontrado = this.profesores.find(us => us.user === this.buscador.userabuscar &&
            us.pass === this.buscador.passabuscar);
            console.log(this.buscador.profesorencontrado);
          },
          buscarPrecep() {
            this.buscador.preceptorencontrado = this.preceptores.find(us => us.user === this.buscador.userabuscar &&
            us.pass === this.buscador.passabuscar);
            console.log(this.buscador.preceptorencontrado);
          }
        }
      });
    }
    if (window.addEventListener) window.addEventListener("load", autorun, false);
    else if (window.attachEvent) window.attachEvent("onload", autorun);
    else window.onload = autorun;