CSLP.Workboard.Views.QuestionView = Backbone.View.extend({

    events : {
        'click .btn-next-question' : 'nextQuestion',
        'click .btn-finish-question' : 'finishQuestion',
        'click .button-option-reply' : 'optionScale',
        'click .btn-prev-question' : 'prevQuestion'
    },
    currentActivity : null,

    pivote : null,

    questions : null,

    answer : null,

    point : null,

    initialize : function() {
        
    },
    setActivity : function(activity){
        this.currentActivity = activity;
        console.log(this.currentActivity);
        var arrayQuestion = this.currentActivity.get('questions');
        var permQuestions = [];
        //recolectamos las preguntas, comprobando los permisos.
        arrayQuestion.forEach(element => {
            if(this.currentActivity.get('qualitative') == 'true' && element.type == 'qualitative'){
                permQuestions.push(element);
            }
            if(this.currentActivity.get('quantitative') == 'true' && element.type == 'quantitative'){
                permQuestions.push(element);
            }
        });
        console.log(permQuestions);
        if(permQuestions.length > 0){
            this.pivote = 0;
            this.questions = permQuestions;
            this.renderQuestion();
            this.$el.show(); 
        }else{
            this.currentActivity.set('questions_answer', null);
            window.WB.currentActivity.save(false);
            window.finishModal.initial();
        }
    },
    renderQuestion : function(){
        //seleccionamos la pregunta a visualizar
        var question = this.questions[this.pivote];
        console.log(question);
        //vaciar los div
        this.$('.modal-question-title').html("");
        this.$('.modal-reply').html("");
        this.$('.modal-button-question').html("");
        //crear div de la pregunta
        $('<div>',{
            class : 'content-modal-title'
        }).append(
            $('<h2>',{
            text : 'Pregunta N°'+(this.pivote+1)+' de '+this.questions.length
        })).append($('<h3>',{
            text : question.question
        })).hide().appendTo('.modal-question-title').fadeIn('slow');
        //Generamos la escala asignada
        if(question.type == 'quantitative'){
            $('<div>',{
                class : 'scale-reply'
            }).append(
                $('<strong>',{
                    text : 'Responde con la siguiente escala (1 = mínimo y '+question.scale+' = máximo):'
                })
            ).append(
                $('<div>',{
                    class : 'buttons-scale'
            })).hide().appendTo('.modal-reply').fadeIn('slow');
            for(var i = 0; i < question.scale; i++){
                this.$('.buttons-scale').append('<button id ="button-option-reply-'+(i+1)+'" class="button-option-reply" name="'+(i+1)+'">'+(i+1)+'</button>');
            }
        }else{
            //generamos la respuesta abierta
            $('<div>',{
                class : 'text-reply'
            }).append(
                $('<strong>',{
                    text : 'Responde con tus palabras:'
                })
            ).append(
                $('<textarea>',{
                    id : 'reply-text-'+question.id,
                    name : 'reply-question',
                    placeholder : 'Ingresa tu respuesta',
                    cols : '5',
                    rows : '3'
                })
            ).hide().appendTo('.modal-reply').fadeIn('slow');
        }
        //Si existe solo 1 pregunta por tanto se visualiza el boton'Finaliza'
        if(this.questions.length == 1){
            $('<div>',{
                class : 'content-modal-button-question'
            }).append(
                $('<button>',{
                    id : 'btn-finish-question-'+question.id,
                    class : 'btn-finish-question',
                    text : 'Finalizar',
                    name : question.type+'-'+question.id
                })
            ).hide().appendTo('.modal-button-question').fadeIn('slow');
        }
        //si es la primera pregunta se visualiza el boton 'Siguiente'
        if(this.pivote == 0 && this.questions.length > 1){
            $('<div>',{
                class : 'content-modal-button-question'
            }).append(
                $('<button>',{
                    id : 'btn-next-question-'+question.id,
                    class : 'btn-next-question',
                    text : 'Siguiente',
                    name : question.type+'-'+question.id
                })
            ).hide().appendTo('.modal-button-question').fadeIn('slow');
        }
        //Si la pregunta no es la primera ni la ultima se visualizan los botones de 'Anterior' y 'Siguiente'
        if(this.pivote > 0){
            console.log(this.questions.length);
            console.log(this.pivote);
            if((this.pivote+1) == this.questions.length && this.questions.length > 1){
                //Si la preguntas es la ultima se visualizan los botones 'Anterior' y 'Finalizar.'
                $('<div>',{
                    class : 'content-modal-button-question'
                }).append(
                    $('<button>',{
                        id : 'btn-prev-question-'+question.id,
                        class : 'btn-prev-question',
                        text : 'Anterior',
                        name : question.type+'-'+question.id
                    })
                ).append(
                    $('<button>',{
                        id : 'btn-finish-question-'+question.id,
                        class : 'btn-finish-question',
                        text : 'Finalizar',
                        name : question.type+'-'+question.id
                    })
                ).hide().appendTo('.modal-button-question').fadeIn('slow');
            }else{
                $('<div>',{
                    class : 'content-modal-button-question'
                }).append(
                    $('<button>',{
                        id : 'btn-prev-question-'+question.id,
                        class : 'btn-prev-question',
                        text : 'Anterior',
                        name : question.type+'-'+question.id
                    })
                ).append(
                    $('<button>',{
                        id : 'btn-next-question-'+question.id,
                        class : 'btn-next-question',
                        text : 'Siguiente',
                        name : question.type+'-'+question.id
                    })
                ).hide().appendTo('.modal-button-question').fadeIn('slow');
            }
            
        }
    },
    saveAnswer : function(id,type){
        if(this.answer != null){
            var arrayAnswer = this.answer;
        }else{
            var arrayAnswer = [];
        }
        if(type == 'qualitative'){
            var answer = this.$('#reply-text-'+id).val();
            arrayAnswer.push({question_id :id, answer : answer, points: null});
        }
        if(type == 'quantitative'){
            var point = this.point;
            arrayAnswer.push({question_id :id, answer : null, points: point});
        }
        this.answer = arrayAnswer;
        console.log(this.answer);
    },
    prevQuestion : function(event){
        var tab = $(event.currentTarget);
        var type = tab.attr('name').split('-');
        this.pivote--;
        this.renderQuestion();
    },
    nextQuestion : function(event){
        var tab = $(event.currentTarget);
        var type = tab.attr('name').split('-');
        var answer = this.$('#reply-text-'+type[1]).val();
        var point = this.point;
        console.log(point);
        console.log(answer);
        if(answer != undefined && answer != '' && answer != ' ' || point != null){
            this.saveAnswer(type[1],type[0]);
            this.pivote++;
            this.renderQuestion();
            
        }else{
            CSLP.message.warning('No se ha registrado una respuesta');  
        }
        answer = null;
        this.point = null;
    },
    finishQuestion : function(event){
        var tab = $(event.currentTarget);
        var type = tab.attr('name').split('-');
        var answer = this.$('#reply-text-'+type[1]).val();
        var point = this.point;
        if(answer != undefined && answer != '' && answer != ' ' || point != null){
            this.saveAnswer(type[1],type[0]);
            CSLP.message.success('Gracias por responder todas las preguntas');
            this.$el.fadeOut();
            console.log('Termino');
            this.currentActivity.set('questions_answer', this.answer);
            window.WB.currentActivity.save(false);
            window.finishModal.initial();
            this.answer = null;
        }
        
    },
    optionScale : function(event){
        
        var tab = $(event.currentTarget);
        var id = tab.attr('id');
        if(this.point != null){
            this.$('#button-option-reply-'+this.point).css('transform','scale(1)');
            this.$('#button-option-reply-'+this.point).css('color','black');
            this.$('#button-option-reply-'+this.point).css('background','white');
        }
        tab.css('transform','scale(1.3)');
        tab.css('color','white');
        tab.css('background','red');
        var point = parseInt(tab.attr('name'));
        this.point = point;
        console.log(this.point);
    }
});