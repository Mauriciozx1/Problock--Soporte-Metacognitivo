$(document).ready(function() {
    window.interpreter = new CSLP.Workboard.Models.JSInterpreter();
    window.codeTester = new CSLP.Workboard.Models.CodeTester();
    window.teamwork = new CSLP.State.Models.Teamworks();
    //Inicializacion de las Colecciones
    window.collections.activityGroups = new CSLP.State.Collections.ActivityGroups();
    
    window.chatView = new CSLP.State.Views.ChatView({
        el : $('#chat')
    });
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

    $( "#btn-chat-popup" ).click(function() {
        window.chatView.show();
    });
    window.regrups = new CSLP.State.Views.ReGrups({
        el : $('#modal-regrup')
    });
   //$('.modal').show();
    

});

var rulesToText = {
    correct_result : "Resultado esperado",
    use_variable : "Usar variables",
    use_conditional : "Usar Condicionales",
    use_loop : "Usar Ciclos",
    use_function : "Usar Funciones"
};