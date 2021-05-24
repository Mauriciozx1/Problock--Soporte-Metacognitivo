CSLP.Maker.Views.QuestionsView = Backbone.View.extend({
   
    events : {
        'change input.cb-questions[type=checkbox]' : 'showQuestions',
        'click .btn-add-questions' : 'addQuestion',
        'click .btn-cancel-question' : 'addQuestion',
        'click .btn-done-question' : 'newQuestion',
        'click .btn-edit-question' : 'editQuestion',
        'click .btn-remove-question' : 'removeQuestion',
        'click .btn-cancel-edit-question' : 'removeEdit',
        'click .btn-done-edit-question' : 'doneEdit'
    },
    currentActivity : undefined,

    pivote : 0,

    changeQuestion : false,

    renderQ : false,

    initialize : function() {
        
    },
    setActivity : function(activity){
        this.currentActivity = activity;
        this.$('input[type=checkbox]').prop('checked', false);
        this.$('.questions-create').fadeOut(0); 
        this.render();
         
    },

    render : function(){
        var questions = this.currentActivity.get('questions');
        this.pivote = 0;
        var quantitative = this.currentActivity.get('quantitative');
        var qualitative = this.currentActivity.get('qualitative');
        this.$('#content-add-quantitative').html("");
        this.$('#content-add-qualitative').html("");
        if(questions != null){
            if(questions.length > 0){
                questions.forEach(element =>{
                    if(element.type == 'quantitative'){
                        this.$('#content-add-'+element.type+'').append('<div id="question-'+element.position+'" class="question"><div id="question-btn-options-'+element.position+'" class="question-btn-options"><span id="delete-'+element.position+'" class="material-icons btn-remove-question" title="Borrar pregunta" name="'+element.type+'">delete_outline</span><span id="edit-'+element.position+'"class="material-icons btn-edit-question" name="'+element.type+'" title="Editar pregunta">edit</span></div><div id="text-question-'+element.position+'" class="text-question"><strong>'+(this.pivote+1)+'- </strong><span>'+element.question+'</span></div><div id="info-scale-'+element.position+'" class="info-scale">Escala: 1 a '+element.scale+'</div></div>');
                    }else{
                        this.$('#content-add-'+element.type+'').append('<div id="question-'+element.position+'" class="question"><div id="question-btn-options-'+element.position+'" class="question-btn-options"><span id="delete-'+element.position+'" class="material-icons btn-remove-question" title="Borrar pregunta" name="'+element.type+'">delete_outline</span><span id="edit-'+element.position+'"class="material-icons btn-edit-question" name="'+element.type+'" title="Editar pregunta">edit</span></div><div id="text-question-'+element.position+'" class="text-question"><strong>'+(this.pivote+1)+'- </strong><span>'+element.question+'</span></div></div>');
                    }
                    this.pivote++;
                });
            }
        }
        if(quantitative == 'true'){
            this.$('#questions-quantitative').prop('checked', true);
            this.$('#add-quantitative').show(500);
            if(this.$('#btn-add-quantitative').css('display') == 'none'){
                this.$('#btn-add-quantitative').show(500);
            }
        }
        if(quantitative == 'false'){
            if(this.$('#btn-add-quantitative').is(':visible')){
                this.$('#btn-add-quantitative').fadeOut(0);
            }
            if(this.$('#add-quantitative').is(':visible')){
                this.$('#add-quantitative').fadeOut(0);
            }
        }
        if(qualitative == 'true'){
            this.$('#questions-qualitative').prop('checked', true);
            this.$('#add-qualitative').show(500);
            if(this.$('#btn-add-qualitative').css('display') == 'none'){
                this.$('#btn-add-qualitative').show(500);
            }
        }
        if(qualitative == 'false'){
            if(this.$('#btn-add-qualitative').is(':visible')){
                this.$('#btn-add-qualitative').fadeOut(0);
            }
            if(this.$('#add-qualitative').is(':visible')){
                this.$('#add-qualitative').fadeOut(0);
            }
        }
        this.renderQ = true;
          
    },
    removeQuestion : function(event){
        var response = confirm('¿Seguro que quiere eliminar esta pregunta?');
        if(response){ 
            var tab = $(event.currentTarget);
            var position = tab.attr('id').split('-');
            var arrayQuestion = this.currentActivity.get('questions');
            var arrayQuestionDelete = this.currentActivity.get('questionsDelete');
            if(arrayQuestionDelete == null){
                arrayQuestionDelete = [];
            }
            this.pivote = 0;
            if(arrayQuestion.length > 0){
                arrayQuestion.forEach(element => {
                    if(element.position == parseInt(position[1]) && element.id != null){
                        arrayQuestionDelete.push(element.id);
                    }
                });
                this.$('#question-'+position[1]).remove();
                this.$('.question').remove();
                arrayQuestion = this.currentActivity.get('questions');
                arrayQuestion.splice(parseInt(position[1]), 1 );
                console.log(position[1]);
                arrayQuestion.forEach(element => {
                    element.position = this.pivote;
                    if(element.type == 'quantitative'){
                        this.$('#content-add-'+element.type+'').append('<div id="question-'+element.position+'" class="question"><div id="question-btn-options-'+element.position+'" class="question-btn-options"><span id="delete-'+element.position+'" class="material-icons btn-remove-question" title="Borrar pregunta" name="'+element.type+'">delete_outline</span><span id="edit-'+element.position+'"class="material-icons btn-edit-question" name="'+element.type+'" title="Editar pregunta">edit</span></div><div id="text-question-'+element.position+'" class="text-question"><strong>'+(this.pivote+1)+'- </strong><span>'+element.question+'</span></div><div id="info-scale'+element.position+'" class="info-scale">Escala: 1 a '+element.scale+'</div></div>');
                    }else{
                        this.$('#content-add-'+element.type+'').append('<div id="question-'+element.position+'" class="question"><div id="question-btn-options-'+element.position+'" class="question-btn-options"><span id="delete-'+element.position+'" class="material-icons btn-remove-question" title="Borrar pregunta" name="'+element.type+'">delete_outline</span><span id="edit-'+element.position+'"class="material-icons btn-edit-question" name="'+element.type+'" title="Editar pregunta">edit</span></div><div id="text-question-'+element.position+'" class="text-question"><strong>'+(this.pivote+1)+'- </strong><span>'+element.question+'</span></div></div>');
                    }
                    this.pivote++;
                });

                this.currentActivity.set('questions', arrayQuestion);
                this.currentActivity.set('questionsDelete', arrayQuestionDelete);
                console.log(arrayQuestionDelete);
                console.log(arrayQuestion);
            }
            
            
        }
    },
    doneEdit : function(event){    
        var tab = $(event.currentTarget);
        var id = tab.attr('id').split('-');
        var arrayQuestion = this.currentActivity.get('questions');
        var question = document.getElementById('input-question-edit-'+id[4]).value;
        var scale = null;
        if(tab.attr('name') == "quantitative"){
            scale = this.$('#select-scale-edit-'+id[4]+' option:selected').val();
        }
        if(question != '' && question != ' '){
            this.$('.question').remove();
            arrayQuestion.forEach(element => {
                if(element.position == id[4]){
                    element.question = question;
                    element.scale = scale;
                }
                if(element.type == 'quantitative'){
                    this.$('#content-add-'+element.type+'').append('<div id="question-'+element.position+'" class="question"><div id="question-btn-options-'+element.position+'" class="question-btn-options"><span id="delete-'+element.position+'" class="material-icons btn-remove-question" title="Borrar pregunta" name="'+element.type+'">delete_outline</span><span id="edit-'+element.position+'"class="material-icons btn-edit-question" name="'+element.type+'" title="Editar pregunta">edit</span></div><div id="text-question-'+element.position+'" class="text-question"><strong>'+(element.position+1)+'- </strong><span>'+element.question+'</span></div><div id="info-scale-'+element.position+'" class="info-scale">Escala: 1 a '+element.scale+'</div></div>');
                }else{
                    this.$('#content-add-'+element.type+'').append('<div id="question-'+element.position+'" class="question"><div id="question-btn-options-'+element.position+'" class="question-btn-options"><span id="delete-'+element.position+'" class="material-icons btn-remove-question" title="Borrar pregunta" name="'+element.type+'">delete_outline</span><span id="edit-'+element.position+'"class="material-icons btn-edit-question" name="'+element.type+'" title="Editar pregunta">edit</span></div><div id="text-question-'+element.position+'" class="text-question"><strong>'+(element.position+1)+'- </strong><span>'+element.question+'</span></div></div>');
                }
            });
            this.currentActivity.set('questions', arrayQuestion);
            console.log(arrayQuestion);
        }
    },
    removeEdit : function(event){
        var tab = $(event.currentTarget);
        var id = tab.attr('id').split('-');
        this.$('#input-question-option-'+id[4]).remove();
        if(tab.attr('name') == 'quantitative'){
            this.$('#scale-options-'+id[4]).remove();
        }
        this.$('#question-btn-options-'+id[4]).show(500);
        this.$('#text-question-'+id[4]).show(500);
    },
    editQuestion : function(event){
        var tab = $(event.currentTarget);
        var id = tab.attr('id').split('-');
        var question = this.$('#text-question-'+id[1]).text().slice(3);
        console.log(this.currentActivity.get('questions'));
        this.$('#question-btn-options-'+id[1]).fadeOut(0);
        this.$('#text-question-'+id[1]).fadeOut(0);
        this.$('#info-scale-'+id[1]).fadeOut(0);
        $("<div>",{
            id : 'input-question-option-'+id[1],
            class : 'input-question-option'
            }).append(
                $('<input>',{
                    id : 'input-question-edit-'+id[1],
                    type : 'text',
                    name : tab.attr('name'),
                    value : question,
                    class : "input-question"
                })
            ).append(
                $('<span>',{
                    id : 'btn-done-edit-question-'+id[1],
                    name : tab.attr('name'),
                    class : "material-icons btn-done-edit-question",
                    text : "done"
                })
            ).append(
                $('<span>',{
                    id : "btn-cancel-edit-question-"+id[1],
                    class : "material-icons btn-cancel-edit-question",
                    name : tab.attr('name'),
                    text : "close",
                })
            ).hide().appendTo('#question-'+id[1]).fadeIn('slow');
            if(tab.attr('name') == 'quantitative'){
            $("<div>",{
                id : "scale-options-"+id[1],
                class : "scale-options",
                }).append(
                    $('<strong>',{
                        text : "Defina la escala "
                    })
                ).append(
                    $('<select>',{
                        id : "select-scale-edit-"+id[1],
                        name : "select-scale",
                        required : "required"
                    }).append(
                        $('<option>',{
                            value : "",
                            text : "Escala:",
                            selected : "selected"
                        })
                    ).append(
                        $('<option>',{
                            value : "2",
                            text : "1 a 2",
                        })
                    ).append(
                        $('<option>',{
                            value : "3",
                            text : "1 a 3",
                        })
                    ).append(
                        $('<option>',{
                            value : "4",
                            text : "1 a 4",
                        })
                    ).append(
                        $('<option>',{
                            value : "5",
                            text : "1 a 5",
                        })
                    ).append(
                        $('<option>',{
                            value : "6",
                            text : "1 a 6",
                        })
                    ).append(
                        $('<option>',{
                            value : "7",
                            text : "1 a 7",
                        })
                    ).append(
                        $('<option>',{
                            value : "8",
                            text : "1 a 8",
                        })
                    ).append(
                        $('<option>',{
                            value : "9",
                            text : "1 a 9",
                        })
                    ).append(
                        $('<option>',{
                            value : "10",
                            text : "1 a 10",
                        })
                    )
                ).hide().appendTo('#question-'+id[1]).fadeIn('slow');
        }else{

        }
        console.log(question);
    },
    newQuestion : function(event){
        var tab = $(event.currentTarget);
        var question = document.getElementById('input-question-'+tab.attr('name')).value;
        var scale = null;
        if(tab.attr('name') == "quantitative"){
            scale = this.$("#select-scale option:selected").val();
        }
        console.log(parseInt(scale));
        if(question != '' && question != ' '){
            if(this.currentActivity.get('questions') == null){
                var arrayQuestion = [{ id: null, position: this.pivote, question : question, type : tab.attr('name'), scale : parseInt(scale)}];
            }else{
                var arrayQuestion = this.currentActivity.get('questions');
                arrayQuestion.push({ id: null, position:this.pivote, question : question, type : tab.attr('name'), scale :  parseInt(scale)});
            }
            this.$('#content-create-question-'+tab.attr('name')+'').toggle('500');
            this.currentActivity.set('questions',arrayQuestion);
            if(tab.attr('name') == "quantitative"){
                this.$('#content-add-'+tab.attr('name')+'').append('<div id="question-'+this.pivote+'" class="question"><div id="question-btn-options-'+this.pivote+'" class="question-btn-options"><span id="delete-'+this.pivote+'" class="material-icons btn-remove-question" title="Borrar pregunta" name="'+tab.attr('name')+'">delete_outline</span><span id="edit-'+this.pivote+'"class="material-icons btn-edit-question" name="'+tab.attr('name')+'" title="Editar pregunta">edit</span></div><div id="text-question-'+this.pivote+'" class="text-question"><strong>'+(this.pivote+1)+'- </strong><span>'+question+'</span></div><div id="info-scale-'+this.pivote+'" class="info-scale">Escala: 1 a '+parseInt(scale)+'</div></div>');
            }else{
                this.$('#content-add-'+tab.attr('name')+'').append('<div id="question-'+this.pivote+'" class="question"><div id="question-btn-options-'+this.pivote+'" class="question-btn-options"><span id="delete-'+this.pivote+'" class="material-icons btn-remove-question" title="Borrar pregunta" name="'+tab.attr('name')+'">delete_outline</span><span id="edit-'+this.pivote+'"class="material-icons btn-edit-question" name="'+tab.attr('name')+'" title="Editar pregunta">edit</span></div><div id="text-question-'+this.pivote+'" class="text-question"><strong>'+(this.pivote+1)+'- </strong><span>'+question+'</span></div></div>');
            }
            question = "";
            this.$('#btn-add-'+tab.attr('name')).show(500);
            this.pivote++;
            console.log(arrayQuestion);       
        }
    },
    addQuestion : function(event){
        var tab = $(event.currentTarget);
        var array = tab.attr('name').split('-');
        var question = document.getElementById('input-question-'+array[3]).value;
        question = "";
        this.$('#'+tab.attr('name')+'').toggle('500');
        this.$('#btn-add-'+array[3]+'').toggle('500');
        
        
    },
    showQuestions : function(event){
        
        var tab = $(event.currentTarget);
        var checked = document.getElementById(tab.attr('id')).checked;
        var array = tab.attr('name').split('-');
        if(checked == true){
            this.render();
            if(this.$('#btn-add-'+array[1]+'').css('display') == 'none'){
                this.$('#btn-add-'+array[1]+'').show(500);
            }
            this.$('#'+tab.attr('name')+'').show('500');
            if(array[1] == 'quantitative'){
                this.currentActivity.set('quantitative', 'true');
            }
            if(array[1] == 'qualitative'){
                this.currentActivity.set('qualitative', 'true');
            }
        }else{
            if(array[1] == 'quantitative'){
                this.currentActivity.set('quantitative', 'false');
            }
            if(array[1] == 'qualitative'){
                this.currentActivity.set('qualitative', 'false');
            }
            this.$('#'+tab.attr('name')+'').fadeOut('0');
        }
    },
});