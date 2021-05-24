CSLP.State.Models.Activity = Backbone.Model.extend({
    url: '',
    defaults : {
        id : undefined,
        name : '',
        locked : true,
        completed : false,
        resource : '',
        answer : undefined,
        selected : false,
        type : undefined,
        problem_type : undefined,
        rules : undefined,
        successPercent : 0,
        questions : null,
        questionsDelete : null,
        quantitative : "false",
        qualitative : "false"
    },

    fetched : false,

    view : undefined,

    initialize : function() {
    
    },
    
    
    delete : function(){
        this.id = undefined;
        this.trigger('delete');

        $.post(basePath + '/maker/deleteactivity',{
            id : this.get('id')
        },function(){
            this.destroy();
        });

    },

    save : function(){
        var self = this;
        $.post(basePath + '/maker/saveactivity/',{
            id : this.get('id')? this.get('id') : -1,
            name : this.get('name'),
            resource : this.get('resource'),
            rules : JSON.stringify(this.get('rules')),
            answer : this.get('answer'),
            questions : this.get('questions') ? this.get('questions') : null,
            questionsDelete : this.get('questionsDelete') ? this.get('questionsDelete') : null,
            quantitative : this.get('quantitative'),
            qualitative : this.get('qualitative')
        },function(response){
            console.log(response);
            if(response == ""){
                self.set('questions', null);
            }else{
                self.set('questions', response);
            }
            self.set('questionsDelete', null);
        });
    },

});
