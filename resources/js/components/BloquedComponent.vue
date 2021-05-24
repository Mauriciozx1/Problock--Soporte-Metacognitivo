<template>
<div class="alert-content">
    

</div>
</template>

<script>
    import html2canvas from 'html2canvas';
    
    export default {
        props:{
            user: this.user,
            userscount : this.userscount,
            teamworkid : this.teamworkid,
        },
        data() {
            return {
                myid : this.user.id,
                usersVoted : [],
                usersTeam : [],
                usersWait : [],
                resultVoted : undefined,
                start : false,
                blocked : true,
                voted : null,
                userLider : '',
                score : 0,
                outputLider : null,
                finish : false,
                usersEsperando : 0,
                idActivity: 0
            }
        },
        created() {
                this.setType();
                
                Echo.join('workspace.' + this.idActivity)
                

                .joining(user => {
                    CSLP.message.success( user.name+' '+user.flastname + ' se ha conectado.');
                    this.usersTeam.push(user);
                    this.setType();
                })

                .leaving(user => {
                    CSLP.message.error( user.name+' '+user.flastname + ' se ha desconectado.');
                    this.usersTeam = this.usersTeam.filter(u => u.id != user.id);
                    if(this.start == true){
                        if(this.finish == false){
                            this.blocked = true;
                        }
                        this.usersWait.forEach(element => {
                            if(element.user_id == user.id){
                                this.usersEsperando--;
                            }
                        });  
                        //Bloquear actividad, se fue un integrante
                        }
                        if(this.usersWait.length >= this.usersTeam.length){
                        this.usersEsperando = this.usersTeam.length;
                        }
                        if(this.usersWait.length <= this.usersTeam.length){
                            this.usersEsperando = this.usersWait.length;
                        }
                })
                .listenForWhisper('update', dato => {
                    this.usersWait = dato.users;
                    this.idActivity = dato.id;
                    if(this.usersWait.length < dato.users.length){
                        this.wait();
                    }
                        
                })

                .listenForWhisper('voted', userVote => {
                    this.usersVoted.push(userVote);
                    this.getResult();
                })

                .listenForWhisper('recivedScreen',imgData =>{
                    this.outputLider = imgData.img;
                })
                .listenForWhisper('test',data =>{
                    console.log(data);
                })
                .listenForWhisper('soliciteFinish', data => {
                    if(this.user.id == this.userLider[0].id){
                        this.score = data.score;
                        this.finish = true;
                        html2canvas(document.querySelector("#modal-content")).then(canvas =>{
                            var dataimg = canvas.toDataURL();
                            this.outputLider = dataimg;
                            Echo.join('workspace.'+this.idActivity)
                                .whisper('recivedScreen',{img : dataimg});
                        })
                    }
                })
            },
                //Estan todos conectados y la actividad aun no empieza
                
                     
        methods: {
            finishVote : function(value){
                this.usersVoted = [];
                this.voted = null;
                this.resultVoted = undefined;
                this.outputLider = null;
                if(this.user.id != this.userLider[0].id){
                    if(value == true){
                        $('.btn-next-team').show();
                        $('.wait-finish').hide();
                        $('.wait-users').hide();
                        setTimeout(function(){
                            this.finish = false;
                            this.blocked = true;
                            this.start = false;
                            }, 5000); 
                    }
                    else{
                        $('.finish-modal').hide();
                        $('.wait-finish').hide(); 
                    }
                    
                }
                if(this.user.id == this.userLider[0].id){
                    if(value == true){
                        $('.wait-users').hide();
                        $('.wait-finish').hide();
                    }else{
                        $('.wait-finish').hide();
                        $('.finish-modal').hide();
                    }   
                }
            },
            getResult : function(){
                var voteYes = 0;
                var voteNo = 0;
                if(this.userscount == this.usersVoted.length){
                    this.usersVoted.forEach(element => {
                        if(element.voted == true) return voteYes++;
                        if(element.voted == false) return voteNo++;
                    });
                    if(voteYes > voteNo){
                        
                        $('.wait-group').hide();
                        this.resultVoted = true;
                        this.finish == true;
                        
                    }
                    if(voteNo > voteYes){
                        CSLP.message.error('El termino de la actividad fue rechazado.');
                        $('.wait-group').hide();
                        this.resultVoted = false;
                        
                    }
                }
            },
            wait : function(){
                if(this.usersWait.length >= this.usersTeam.length){
                    this.usersEsperando = this.usersTeam.length;
                }
                if(this.usersWait.length <= this.usersTeam.length){
                    this.usersEsperando = this.usersWait.length;
                }
                if(this.usersWait.length == this.userscount && this.usersWait.length == this.usersTeam.length){
                    if(this.finish == false){
                        this.blocked = false;
                        this.start = true;
                        setTimeout(function(){
                            CSLP.message.success('La actividad ha comenzado.');
                        }, 3000);
                    }
                    
                }
            },
            setType : function (){
                axios.get('/workboard/wait/'+this.teamworkid).then(response => {
                    this.usersWait = response.data['arrayWait'];
                    var activity = response.data['activiti'];
                    this.idActivity = activity;
                    this.userLider = this.usersWait[0].userLider;
                    if(this.usersWait.length == this.userscount){
                        if(this.userLider[0].id == this.user.id){
                            CSLP.message.warning('¡Tu eres el Líder!');
                        }else{
                            CSLP.message.warning('El líder de la actividad es: ' + this.usersWait[0].userLider[0].nLastname);
                        }
                        this.wait();
                        
                    }
                        
                })
            },
            update : function(){
                Echo.join('workspace.'+ this.idActivity)
                    .whisper('update', this.usersWait);
            },
            toggle : function(){
                this.isOpen = !this.isOpen;
            },
            votedUser : function(value){
                this.voted = value;
                this.usersVoted.push({
                        name : this.user.name, 
                        flastname : this.user.flastname, 
                        voted : this.voted
                        });
                Echo.join('workspace.'+this.idActivity)
                    .whisper('voted', {
                        name : this.user.name, 
                        flastname : this.user.flastname, 
                        voted : this.voted
                        });
                this.getResult();
                
            },
        }
    }
</script>
<style>

.loader {
  border: 16px solid #f3f3f3;
  border-radius: 50%;
  border-top: 16px solid #249b33;
  width: 100px;
  height: 100px;
  -webkit-animation: spin 2s linear infinite; /* Safari */
  animation: spin 2s linear infinite;
}

/* Safari */
@-webkit-keyframes spin {
  0% { -webkit-transform: rotate(0deg); }
  100% { -webkit-transform: rotate(360deg); }
}

@keyframes spin {
  0% { transform: rotate(0deg); }
  100% { transform: rotate(360deg); }
}
.content-grup{
    display: inline-flex;
    margin: 1rem;
    text-align: center;
    vertical-align: middle;
}
.content-grup .intergers-list-grup .btn-user-wait .ico-img{
    margin: auto;
    background-color: rgb(76, 165, 76);
    -webkit-border-radius:1px 100%;
    border-radius:20px;
    padding: 1rem;
    width: 30px;
    height: 30px;
}
.content-grup .intergers-list-grup .btn-user-wait .ico-img .section-ico-img {
    display: inline;
}

.btn-user-wait .ico-img h4{
    visibility: hidden;
    
}
.content-grup .intergers-list-grup .btn-user-wait :hover .ico-img{
    opacity: 0.69;

}
.btn-user-wait:hover h4{
    visibility: visible;
   

}
.intergers-list-grup{
    margin: 1rem;
}
.result-activity{
    padding: auto;
    margin: auto;
    max-height: 100%;
    max-width: 100%
}
.result-activity img{
    margin: auto;
    max-width: 100%;
    max-height: 100%;
}
.imgDom{
    margin: auto;
    max-width: 100%;
    max-height: 100%;
}
.wait-group{
    width: 100%;
    height: 100%;
    position:fixed;
    top:0px;
    left:0px;
    z-index:12;
    filter:alpha(opacity=65);
   -moz-opacity:65;
    opacity:0.65;
    background:#999;
}
.gg-close-r {
    box-sizing: border-box;
    position: relative;
    display: block;
    transform: scale(var(--ggs,1));
    width: 22px;
    height: 22px;
    border: 2px solid;
    border-radius: 4px;
    color: rgb(173, 13, 21);
}
.gg-close-r::after,
.gg-close-r::before {
    content: "";
    display: block;
    box-sizing: border-box;
    position: absolute;
    width: 12px;
    height: 2px;
    background: currentColor;
    transform: rotate(45deg);
    border-radius: 5px;
    top: 8px;
    left: 3px;
    color: rgb(173, 13, 21);
}
.gg-close-r::after {
    transform: rotate(-45deg);
    color: rgb(173, 13, 21);
} 
.gg-check-r {
    box-sizing: border-box;
    position: relative;
    display: block;
    width: 22px;
    height: 22px;
    border: 2px solid;
    transform: scale(var(--ggs,1));
    border-radius: 4px;
    color: rgb(35, 138, 52);
}
.gg-check-r::after {
    content: "";
    display: block;
    box-sizing: border-box;
    position: absolute;
    left: 3px;
    top: -1px;
    width: 6px;
    height: 10px;
    border-width: 0 2px 2px 0;
    border-style: solid;
    color: rgb(35, 138, 52);
    transform-origin: bottom left;
    transform: rotate(45deg);
} 
.wait-finish{
    margin: auto;
    width: 100%;
    height: 100%;
    position:fixed;
    top:0px;
    left:0px;
    z-index:13;
    filter:alpha(opacity=65);
   -moz-opacity:65;
    opacity:0.9;
    background:#999;
    text-align: center;
    overflow: scroll;
}
.content-wait-finish{
    margin: auto;
    width: 40%;
    background-color: #000000;
    border: 1px solid rgb(35, 138, 52);
    opacity:100%;
    color: white;
    text-align: center;
    margin-top: 5%;
}
.content-voted{
    text-align: center;
    display: flex;
    
}
.content-voted li{
    margin: auto;
    list-style: none;
}
.content-voted li i{
    margin: auto;
}
.content-wait{
    margin: 10px auto;
    width: 40%;
    background-color: #000000;
    border: 1px solid rgb(35, 138, 52);
    opacity:100%;
    color: white;
    text-align: center;
    margin-top: 20%;
    cursor: wait;
}
.content-wait li{
    list-style: none;
}
</style>
© 20