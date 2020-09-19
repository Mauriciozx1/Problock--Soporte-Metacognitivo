CSLP.Maker.Models.IMSEncoder = Backbone.Model.extend({
    defaults : {},

    exercise : {
        name : ''
    },

    activityGroups : {
        activationTask : undefined,
        elaborationTask : undefined,
        consolidationTask : undefined,
        reflectionTask : undefined,
    },

    replacePatterns : {
        lowerCase : {
            a : new RegExp('[áàäâãå]', 'g'),
            e : new RegExp('[éèëê]', 'g'),
            i : new RegExp('[íìïî]', 'g'),
            o : new RegExp('[óòöôõ]', 'g'),
            u : new RegExp('[úùüû]', 'g'),
            c : new RegExp('[ç]', 'g'),
            n : new RegExp('[ñ]', 'g'),
            y : new RegExp('[ýÿ]', 'g')
        },

        upperCase : {
            A : new RegExp('[ÁÀÄÂÃÅ]', 'g'),
            E : new RegExp('[ÉÈËÊ]', 'g'),
            I : new RegExp('[ÍÌÏÎ]', 'g'),
            O : new RegExp('[ÓÒÖÔÕ]', 'g'),
            U : new RegExp('[ÚÙÜÛ]', 'g'),
            C : new RegExp('[Ç]', 'g'),
            N : new RegExp('[Ñ]', 'g'),
            Y : new RegExp('[Ý]', 'g')
        }
    },

    initialize : function() {

    },

    setData : function(exercise, activityGroups) {
        this.exercise = exercise;
        this.activityGroups = activityGroups;
    },

    //Remueve del string todos los caracteres que no sean letra, numero o espacio
    cleanSpecialCharacters : function(value) {

        for(var letter in this.replacePatterns.lowerCase) {
            value = value.replace(this.replacePatterns.lowerCase[letter], letter);
        }

        //Quita todos los caracteres que no sean letra, numero o espacio
        return value.replace(/[^\w\d\s]/gi, "");
    },

    getSneakString : function(string) {

        string = string.toLowerCase();
        string = this.cleanSpecialCharacters(string);
        //Remplaza todos los espacios por guiones
        return string.replace(/ /g, '-');
    },

    generateData : function() {

        this.exercise.sneakName = this.getSneakString(this.exercise.name);

        for(var i in this.activityGroups) {
            for(var e in this.activityGroups[i].tasks) {
                this.activityGroups[i].tasks[e].sneakName = this.getSneakString(this.activityGroups[i].tasks[e].name);
            }
        }
    },

    getActivityStructure : function(activity, final) {
        final = final || false;

        var finalStructure = '';
        if(final) {
            finalStructure = '\
            <imsld:on-completion>\
        <imsld:change-property-value>\
        <imsld:property-ref ref="P-Activation-Task-Completed-Flag"/>\
            <imsld:property-value>true</imsld:property-value>\
        </imsld:change-property-value>\
        </imsld:on-completion>';
        }
        var structure = '                   \
        <imsld:learning-activity identifier="LA-' + activity.sneakName + '">\
            <imsld:title>' + activity.name + '</imsld:title>\
        <imsld:environment-ref ref="E-interactive-learning-platform"/>\
            <imsld:learning-objectives>\
        <imsld:item identifierref="RES-' + activity.sneakName + '-objectives"/>\
            </imsld:learning-objectives>\
        <imsld:activity-description>\
        <imsld:item identifier="I-' + activity.sneakName + '" identifierref="RES-' + activity.sneakName + '"/>\
            </imsld:activity-description>\
            ' + finalStructure + '\
        </imsld:learning-activity>';

        return structure;
    },

    getActivitiesStructures : function() {
        var structure = '';

        for(var i in this.activityGroups) {
            for(var e in this.activityGroups[i].tasks) {
                structure += this.getActivityStructure(this.activityGroups[i].tasks[e]);
            }
        }

        return structure;

    },

    getActivitiesResultsFlags : function() {

        var resultsFlags = '';

        for(var i in this.activityGroups) {
            for(var e in this.activityGroups[i].tasks) {

                resultsFlags += '<imsld:locpers-property identifier="P-' + this.activityGroups[i].tasks[e].sneakName + '-Result">\
                    <imsld:datatype datatype="integer"/>\
                    <imsld:initial-value>""</imsld:initial-value>\
                </imsld:locpers-property>';
            }
        }

        return resultsFlags;
    },

    getResourcesRefs : function() {
        var resourcesRefs = '';
        for(var i in this.activityGroups) {
            for(var e in this.activityGroups[i].tasks) {
                resourcesRefs += '<imscp:resource identifier="RES-' + this.activityGroups[i].tasks[e].sneakName + '" type="webcontent"/>'
            }
        }
        return resourcesRefs;
    },

    getActivitiesRefs : function(activityGroup) {

        var activitiesRefs = '';

        for(var i in activityGroup.tasks) {
            activitiesRefs += '<imsld:learning-activity-ref ref="LA-' + activityGroup.tasks[i].sneakName + '"/>';
        }
        return activitiesRefs;
    },

    getEncodedExercise : function(exercise, activityGroups) {
        this.setData(exercise, activityGroups);
        return this.generateIMSLDExercise();
    },

    generateIMSLDExercise : function() {

        this.generateData();

        return '<imscp:manifest xmlns:imscp="http://www.imsglobal.org/xsd/imscp_v1p1"\
        xmlns:imsld="http://www.imsglobal.org/xsd/imsld_v1p0"\
        xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"\
        xsi:schemaLocation="http://www.imsglobal.org/xsd/imscp_v1p1 http://www.imsglobal.org/xsd/imscp_v1p1p3.xsd http://www.imsglobal.org/xsd/imsld_v1p0 http://www.imsglobal.org/xsd/imsld_level_b_v1p0.xsd"\
        identifier="Calculator-Manifest">\
            <imscp:metadata>\
        <imscp:schema>IMS Metadata</imscp:schema>\
        <imscp:schemaversion>1.2</imscp:schemaversion>\
        </imscp:metadata>\
        <imscp:organizations>\
        <imsld:learning-design identifier="LD-' + this.exercise.sneakName + '" uri="URI" level="B">\
            <imsld:title>' + this.exercise.name + '</imsld:title>\
        <imsld:learning-objectives>\
        <imsld:item identifier=LOB-"' + this.exercise.sneakName + '-Objectives"\
        identifierref="RES-' + this.exercise.sneakName + '-Objectives"/>\
            </imsld:learning-objectives>\
        <imsld:prerequisites>\
        <imsld:item identifier="PREQ-Learning-Platform-Familiarity" identifierref="RES-Learning-Platform-Familiarity"/>\
            </imsld:prerequisites>\
        <imsld:components>\
        <imsld:roles>\
        <imsld:learner identifier="R-student"/>\
            </imsld:roles>\
        <imsld:properties>\
        <imsld:locpers-property identifier="P-Activation-Task-Completed-Flag">\
            <imsld:datatype datatype="boolean"/>\
            <imsld:initial-value>false</imsld:initial-value>\
        </imsld:locpers-property>\
        <imsld:locpers-property identifier="P-Elaboration-Task-Completed-Flag">\
            <imsld:datatype datatype="boolean"/>\
            <imsld:initial-value>false</imsld:initial-value>\
        </imsld:locpers-property>\
        <imsld:locpers-property identifier="P-Consolidation-Task-Completed-Flag">\
            <imsld:datatype datatype="boolean"/>\
            <imsld:initial-value>false</imsld:initial-value>\
        </imsld:locpers-property>\
        <imsld:locpers-property identifier="P-Reflection-Task-Completed-Flag">\
            <imsld:datatype datatype="boolean"/>\
            <imsld:initial-value>false</imsld:initial-value>\
        </imsld:locpers-property>\
        ' + this.getActivitiesResultsFlags() + '\
        </imsld:properties>\
        \
        <imsld:activities>\
        \
        ' + this.getActivitiesStructures() + '\
        \
        </imsld:learning-activity>\
        \
        <imsld:activity-structure identifier="AS-activation-task" number-to-select="1" structure-type="sequence">\
            <imsld:title>' + this.activityGroups.activationTask.name + '</imsld:title>\
        <imsld:environment-ref ref="E-interactive-learning-platform"/>\
            ' + this.getActivitiesRefs(this.activityGroups.activationTask) + '\
            </imsld:activity-structure>\
        \
        <imsld:activity-structure identifier="AS-elaboration-task" number-to-select="1" structure-type="sequence">\
            <imsld:title>' + this.activityGroups.elaborationTask.name + '</imsld:title>\
        <imsld:environment-ref ref="E-interactive-learning-platform"/>\
            ' + this.getActivitiesRefs(this.activityGroups.elaborationTask) + '\
            </imsld:activity-structure>\
        \
        <imsld:activity-structure identifier="AS-consolidation-task" number-to-select="1" structure-type="sequence">\
            <imsld:title>' + this.activityGroups.consolidationTask.name + '</imsld:title>\
        <imsld:environment-ref ref="E-interactive-learning-platform"/>\
            ' + this.getActivitiesRefs(this.activityGroups.consolidationTask) + '\
            </imsld:activity-structure>\
        \
        <imsld:activity-structure identifier="AS-reflection-task" number-to-select="1" structure-type="sequence">\
            <imsld:title>' + this.activityGroups.reflectionTask.name + '</imsld:title>\
        ' + this.getActivitiesRefs(this.activityGroups.reflectionTask) + '\
        </imsld:activity-structure>\
        \
        <imsld:activity-structure identifier="AS-PBL-storyline" number-to-select="4" structure-type="sequence">\
            <imsld:environment-ref ref="E-interactive-learning-platform"/>\
            <imsld:activity-structure-ref ref="AS-activation-task"/>\
            <imsld:activity-structure-ref ref="AS-elaboration-task"/>\
            <imsld:activity-structure-ref ref="AS-consolidation-task"/>\
            <imsld:activity-structure-ref ref="AS-reflection-task"/>\
            </imsld:activity-structure>\
        \
        </imsld:activities>\
        \
        <imsld:environments>\
        <imsld:environment identifier="E-interactive-learning-platform">\
            <imsld:title>Plataforma Interactiva de Aprendizaje</imsld:title>\
        </imsld:environment>\
        </imsld:environments>\
        \
        </imsld:components>\
        \
        <imsld:method>\
        \
        <imsld:play identifier="PLAY-PBL-Storyline" isvisible="true">\
        \
            <imsld:act identifier="ACT-interactive-learning">\
            <imsld:role-part identifier="RP-interactive-learning">\
            <imsld:role-ref ref="R-student"/>\
            <imsld:activity-structure-ref ref="AS-PBL-storyline"/>\
            </imsld:role-part>\
        <imsld:complete-act>\
        <imsld:when-role-part-completed ref="RP-interactive-learning"/>\
            </imsld:complete-act>\
        </imsld:act>\
        \
        <imsld:complete-play>\
        <imsld:when-last-act-completed/>\
        </imsld:complete-play>\
        \
        </imsld:play>\
        \
        <imsld:conditions>\
        <imsld:if>\
        <imsld:is>\
        <imsld:property-ref ref="P-Consolidation-Task-Completed-Flag"/>\
            <imsld:property-value>true</imsld:property-value>\
        </imsld:is>\
        </imsld:if>\
        <imsld:then>\
        <imsld:show>\
        <imsld:learning-activity-ref ref="LA-' + this.activityGroups.reflectionTask.tasks[0].sneakName + '"/>\
            </imsld:show>\
        </imsld:then>\
        <imsld:else>\
        \
        <imsld:if>\
        <imsld:is>\
        <imsld:property-ref ref="P-Elaboration-Task-Completed-Flag"/>\
            <imsld:property-value>true</imsld:property-value>\
        </imsld:is>\
        </imsld:if>\
        <imsld:then>\
        <imsld:show>\
        <imsld:learning-activity-ref ref="LA-' + this.activityGroups.consolidationTask.tasks[0].sneakName + '"/>\
            </imsld:show>\
        </imsld:then>\
        <imsld:else>\
        \
        <imsld:if>\
        <imsld:is>\
        <imsld:property-ref ref="P-Activation-Task-Completed-Flag"/>\
            <imsld:property-value>true</imsld:property-value>\
        </imsld:is>\
        </imsld:if>\
        <imsld:then>\
        <imsld:show>\
        <imsld:learning-activity-ref ref="LA-' + this.activityGroups.elaborationTask.tasks[0].sneakName + '"/>\
            </imsld:show>\
        </imsld:then>\
        <imsld:else>\
        <imsld:show>\
        <imsld:learning-activity-ref ref="LA-' + this.activityGroups.activationTask.tasks[0].sneakName + '"/>\
            </imsld:show>\
        </imsld:else>\
        </imsld:else>\
        </imsld:else>\
        </imsld:conditions>\
        </imsld:method>\
        </imsld:learning-design>\
        </imscp:organizations>\
        <imscp:resources>\
        <imscp:resource identifier="RES-Learning-Platform-Familiarity" type="webcontent"/>\
        <imscp:resource identifier="RES-' + this.exercise.sneakName + '-Objectives" type="webcontent"/>\
        ' + this.getResourcesRefs() + '\
        </imscp:resources>\
        </imscp:manifest>';
    }

});
