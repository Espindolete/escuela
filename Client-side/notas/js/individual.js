        function autorun() {
            }
            new Vue({
                el: '#app',
                data: {
                    materias : [],
                    selected: null
                },
                mounted() {
                    this.getPersona();
                },
                methods: {
                    getPersona : function (){
                        axios.get('http://localhost:3000/getMaterias')
                        .then(response => {
                            console.log(response);
                            this.materias = response.data;
                        })
                        .catch(error => { console.log(error) });
                    }
                }
            })
        if (window.addEventListener) window.addEventListener("load", autorun, false);
        else if (window.attachEvent) window.attachEvent("onload", autorun);
        else window.onload = autorun;