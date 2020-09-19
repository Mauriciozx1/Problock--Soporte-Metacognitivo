CSLP.Workboard.Models.IMSLDParser = Backbone.Model.extend({

    defaults : {
        exerciseXML : '',
        parsedActivities : '',
        parsedPlay : '',
        title : ''
    },

    initialize :function(){

    },

    getXML : function(){
        return this.get('exerciseXML');
    },

    getExerciseTitle : function(){
        return this.get('title');
    },

    getParsedExercise : function(){
        return this.get('parsedActivities')
    },

    parse : function(){
        var xml = $(this.getXML());
        //Quitando los marcadores de la especificacion
        xml.html(xml.html().replace(/(imsld:)|(imscp:)/g, ''));

        this.parseTitle(xml);
        this.parseActivities(xml);
    },

    //Obtiene las actividades del ejercicio desde el XML
    parseActivities : function(xml){
        var cont = 1;

        var pblStoryline = xml.find('activity-structure[identifier=AS-PBL-storyline]');
        var pblStorylineTasks = pblStoryline.find('activity-structure-ref');

        var activityGroups = [];

        for(var i = 0 ; i < pblStorylineTasks.length ; i++) {
            var activityGroup = {};

            activityGroup.id = $(pblStorylineTasks[i]).attr('ref');

            var activityStructure = xml.find('activity-structure[identifier=' + activityGroup.id + ']');

            activityGroup.name = activityStructure.find('title').html();

            activityGroup.activities = [];

            var activities = activityStructure.find('learning-activity-ref');
            for(var e = 0 ; e < activities.length ; e++) {
                var activity = xml.find('learning-activity[identifier=' + $(activities[e]).attr('ref') + ']');
                var activityData = {
                    id : cont++,
                    identifier : $(activities[e]).attr('ref'),
                    name : activity.find('title').html(),
                    resource_id : activity.find('activity-description>item').attr('identifierref'),
                    objectives : activity.find('learning-objectives>item').attr('identifierref'),
                    //Si establece cambio de flag -- SI tiene un methodo on-completion, obtiene que flag debiese cambiar
                    onComplete : activity.find('on-completion').length > 0? activity.find('on-completion property-ref').attr('ref') : false
                };

                activityGroup.activities.push(activityData);
            }

            activityGroups.push(activityGroup);
        }

        //Estableciendo los grupos de actividades
        this.set('parsedActivities',activityGroups);
    },

    //Obtiene la ejecucion del metodo "play" desde el XML
    parsePlay : function(xml){

    },

    //Obtiene el titulo del ejercicio
    parseTitle : function(xml){
        var title = $(xml.find('title')[0]).html();
        this.set('title',title);
    },

    setXML : function(XML){
        this.set('exerciseXML', XML);
    }

});