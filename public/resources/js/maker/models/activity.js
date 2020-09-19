CSLP.Maker.Models.Activity = Backbone.Model.extend({
    url: '',
    defaults : {
        id : undefined,
        name : '',
        locked : true,
        completed : false,
        resource : '',
        answer : undefined,
        selected : false,
        rules : undefined,
        successPercent : 0
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
        $.post(basePath + '/maker/saveactivity',{
            id : this.get('id')? this.get('id') : -1,
            name : this.get('name'),
            resource : this.get('resource'),
            rules : JSON.stringify(this.get('rules')),
            answer : this.get('answer')
        },function(){
        });
    },

});
