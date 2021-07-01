CSLP.Workboard.Views.VoteView = Backbone.View.extend({

    events : {
        'click .false-voted' : 'voteNo',
        'click .true-voted' : 'voteYes',
        'click .btn-finish-vote-accept' : 'finish',
        'click .btn-finish-vote-cancel' : 'cancel'

    },
    vote : [],

    modelVote : undefined,

    initialize : function() {
        this.$el = $('#wait-finish');
        if(this.modelVote == undefined)
            this.modelVote = new CSLP.Workboard.Models.Vote();
    },

    imgCapture : function() {
        var DOMImg = document.getElementById("modal-content").innerHTML;
        window.WB.currentActivity.set('imgLider', DOMImg);

        html2canvas(document.querySelector("#modal-content")).then(canvas =>{
            console.log(document.querySelector("#modal-content"));
            var dataimg = canvas.toDataURL();
            $("#view-img-screen-finish").attr('src',dataimg);

        })

        
        
        this.show();
    },
    
    show : function(){
        this.$el.fadeIn();
        this.modelVote.set('status', true);
        //
        this.modelVote.set('statusFinish', false);
        this.$('.true-voted').fadeIn('slow');
        this.$('.false-voted').fadeIn('slow');
        this.$('.loader-vote').fadeIn();
        this.$('.btn-finish-vote-accept').fadeOut();
        this.$('.btn-finish-vote-cancel').fadeOut();
        this.$('.obtained-points').append(window.WB.currentActivity.get('score'));
    },
    render : function(){
        var array = this.modelVote.get('vote');
        
        array.forEach(element => {
            if(element.student.id != window.studentUser){
                this.$('.list-content-vote').append('<div id="vote-user' + element.student.id+'" class="vote-user"></div>');
                if(element.methode == 'yes'){
                    this.$("#vote-user" + element.student.id).html("<strong style='color: green;'>" + element.student.name + ' ' + element.student.flastname + "</strong><i class='fa fa-thumbs-o-up'></i>");
                }
                if(element.methode == 'no'){
                    this.$("#vote-user" + element.student.id).html("<strong style='color: red;'>" + element.student.name + ' ' + element.student.flastname + "</strong><i class='fa fa-thumbs-o-down'></i>");

                }
            }
        })       
    },

    cancel : function(){      
        this.$el.fadeOut();
        this.modelVote.clear();
        this.modelVote.set('status',false);
        this.modelVote.set('statusFinish', false);
        this.$('.list-content-vote').html("");
        this.$('.obtained-points').html("");
        
    },

    finish : function(){
        window.WB.currentActivity.set('methode','save');
        //window.WB.currentActivity.save(false);
        //this.modelVote.set('status',false);
        //this.modelVote.set('statusFinish', false);
        this.$el.fadeOut();
        this.modelVote.clear();
        this.$('.list-content-vote').html("");
        this.$('.obtained-points').html("");
        this.$('.wait-group').fadeOut();
        window.questionView.setActivity(window.WB.currentActivity);

    },

    
    voteYes : function() {
        var student = window.studentUser;
        this.$('.true-voted').fadeOut();
        this.$('.false-voted').fadeOut();
        this.$('.loader-vote').fadeIn();
        this.$('.list-content-vote').append('<div id="vote-user'+ student.id+'" class="vote-user"></div>');
        this.$('#vote-user'+ student.id).html('<strong style="color: green;">' + student.name + ' ' + student.flastname + '</strong><i class="fa fa-thumbs-o-up"></i>');
        this.sendVote(student,'yes');
 
    },

    voteNo : function() {
        var student = window.studentUser;
        this.$('.false-voted').fadeOut();
        this.$('.true-voted').fadeOut();
        this.$('.loader-vote').fadeIn();
        this.$('.list-content-vote').append('<div id="vote-user' + student.id +'" class="vote-user"></div>');
        this.$('#vote-user' + student.id).html('<strong style="color: red;">' + student.name + ' ' + student.flastname + '</strong><i class="fa fa-thumbs-o-down"></i>');
        this.sendVote(student,'no');
        console.log('Voto No');
    },
    sendVote : function(student,methode){
        Echo.join('workspace.'+window.WB.currentActivity.get('id')+window.teamworkid)
            .whisper('update-vote',{student : student, methode : methode})
            console.log('SendVote');
            this.modelVote.update({student : student, methode : methode});
    },
});