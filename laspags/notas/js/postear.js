function autorun() {
            new Vue({
                el: '#app',
                data() {
                    return {
                        personas: [],
                        nombre: null,
                        
                        tiempo_libre : null,
                        deporte : null,
                        animales : null,
                        musica : null,
                        publicado : 0
                    }
                },
                methods: {
                    posteAr() {
                        axios.post('http://192.168.1.10/ejemplo/api/api.php/personas',
                            {
                                nombre: this.nombre, tiempo_libre : this.tiempo_libre,
                                deporte : this.deporte, animales : this.animales,
                                musica : this.musica
                            },
                            {
                                headers: {
                                    'Content-Type': 'application/json',
                                }
                            }).then(response => console.log(response))
                            .catch(error => { console.log(error) });
                    }
                },              
            });


        }
        if (window.addEventListener) window.addEventListener("load", autorun, false);
        else if (window.attachEvent) window.attachEvent("onload", autorun);
        else window.onload = autorun;