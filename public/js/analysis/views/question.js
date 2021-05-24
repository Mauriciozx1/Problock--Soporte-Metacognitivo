CSLP.Analysis.Views.Question = Backbone.View.extend({
    
    events : {
        'click .select-activity-view' : 'viewQuestions',
        'click .select-question-view' : 'viewAnswers'
    },

    questionData : null,

    arrayQuestion :[],
    arrayAnswer : [],

    pivote : 0,

    initialize : function() {
        this.questionData = window.questionData;
        console.log(this.questionData);
        this.renderActivity();
    },
    renderActivity : function(){
        this.questionData.forEach(element =>{
            //asignamos el array de preguntas
            var questions = element.questions;
            this.arrayQuestion.push(questions);
            $('<span>',{
                id : 'select-activity-view-'+element.activity.id,
                class : 'select-activity-view',
                text : element.activity.name,
                name : this.pivote,
            }).hide().appendTo('.list-activity').fadeIn('slow');
            this.pivote++;
        });
        console.log(this.arrayQuestion);
    },
    //Visualizar las preguntas, asociadas a la actividad seleccionada
    viewQuestions : function(event){
        this.arrayAnswer = [];
        if(this.$('.questions-data-answer').is(':visible')){
            this.$('.questions-data-answer').fadeOut();
        }
        this.pivote = 0;
        var tab = $(event.currentTarget);
        var name = tab.attr('name');
        var id = tab.attr('id');
        this.$('.select-activity-view').css('background-color','');
        this.$('.select-activity-view').css('color','');
        this.$('.select-activity-view').css('font-weight','');
        this.$('#'+id).css('background-color','darkgray');
        this.$('#'+id).css('color','white');
        this.$('#'+id).css('font-weight','bold');
        var text = this.$('#'+id).text();
        this.$('.title-select').html('<strong>Actividad Seleccionada: '+text+'</strong>').fadeIn('slow');
        this.$('.question-name').html('');
        this.arrayQuestion[name].forEach(element =>{
            var students = element.students;
            this.arrayAnswer.push(students.student);
            $('<span>',{
                class : 'select-question-view',
                id :'select-question-view-'+element.question.id,
                text : element.question.question,
                name : this.pivote
            }).hide().appendTo('.question-name').fadeIn('slow');
            this.pivote++;
        });
        console.log(this.arrayAnswer);
        this.$('.question-list').fadeIn('slow');
        
    },
    //Visualizar las respuestas asociadas a la pregunta seleccionada.
    viewAnswers : function(event){
        var tab = $(event.currentTarget);
        var name = tab.attr('name');
        console.log(this.arrayAnswer[name]);
        
        this.$('.select-question-view').css('background-color','');
        this.$('.select-question-view').css('color','');
        this.$('.select-question-view').css('font-weight','');
        var id = tab.attr('id');
        this.$('#'+id).css('background-color','darkgray');
        this.$('#'+id).css('color','white');
        this.$('#'+id).css('font-weight','bold');
        var text = this.$('#'+id).text();
        this.$('.title-question-select').html('<strong>Pregunta Seleccionada: '+text+'</strong>').fadeIn('slow');
        this.$('.data-question').html('');
        this.arrayAnswer[name].forEach(element =>{
            console.log(element);
            $('<div>',{
                class : 'data',
                id :'data-'+element.id
            }).append(
                $('<span>',{
                   class : 'student-name',
                   text : element.name+' '+element.flastName+' '+element.mlastname+' : '
                })
            ).append(
                $('<span>',{
                class : 'student-answer',
                text : element.answer
             })).hide().appendTo('.data-question').fadeIn('slow');
        });
        if(this.arrayAnswer[name].length == 0){
            $('<div>',{
                class : 'data',
                id :'data-'
            }).append(
                $('<h1>',{
                   class : 'student-name',
                   text : 'No existen respuestas asociada a esta pregunta'
                })
            ).hide().appendTo('.data-question').fadeIn('slow');
        }
        this.$('.questions-data-answer').fadeIn('slow');
    }

});
