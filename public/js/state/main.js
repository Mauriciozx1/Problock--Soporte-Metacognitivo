$(document).ready(function() {
    
    //Inicializacion de las Colecciones
    window.collections.activityGroups = new CSLP.State.Collections.ActivityGroups();
    
    //Inicializacion de las Vistas
    window.consolePanel = new CSLP.Workboard.Views.Console({
        el : $('#output-panel')
    });

    window.blocklyPanel = new CSLP.Workboard.Views.BlocklyPanel({
        el : $('#blockly-panel')
    });
    
    window.objectivesSection = new CSLP.State.Views.ObjectivesSetter({
        el : $('#objectives-section')
    });
    window.viewStudentsSection = new CSLP.State.Views.ViewStudents({
        el : $('#view-students-section')
    });
    window.activityPanel = new CSLP.State.Views.ActivityPanel({
        el : $('#activity-panel')
    });
    window.statusView = new CSLP.State.Views.Status({
        el : $('#maker-container')
    });
    window.collections.activityGroups.add(activityGroups);

    window.statusView.resize();
    /*$(window).load(function() {
        
        //Ajusta el tamaño del panel de blockly en base al nuevo ancho establecido
        //Blockly se ajusta solo cuando se lanza un evento de resize en el window
        window.dispatchEvent(new Event('resize'));

    });
    */
    

});

