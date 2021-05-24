<template>
    <div class="row">
        
    </div>
</template>

<script>
    import html2canvas from 'html2canvas';
    export default {
        props:{
            user: this.user,
            teamworkid: this.teamworkid,
            
        },
        
        data() {
            return {
                usersSends : [],
                notificationScreen : 0,
                notificationGeneral : 0,
                userLiderName: null
            }
        },

        created() {
            Echo.join('chat-team.'+this.teamworkid)
                .listenForWhisper('shareScreen', data => {
                    if(this.usersSends == null){
                        this.usersSends.push(data);
                        this.notificationScreen++;
                        this.notificationGeneral++;
                    }else{
                        var copy = false;
                        var count = 0;
                        this.usersSends.forEach(element =>{
                            if(element.id == data.id){
                                element.img = data.img;
                                copy = true;
                            }
                            count++;
                        });
                        if(copy == false){
                            this.usersSends.push(data); 
                            this.notificationScreen++;
                            this.notificationGeneral++;
                        }
                    }
                })
        },

        methods: {
            
            onView : function(){
                $('.screen-popup').toggle('show');
                this.notificationScreen = 0;

            },
            onPopupScreen : function(){
                $('.screen-popup').hide();
                $('.button-popup-share').toggle('show');
                $('.button-popup-screen').toggle('show');
                this.notificationGeneral = 0; 
            },
            toggle : function(){
                this.isOpen = !this.isOpen;
            },
            sendScreenFinish : function(){

            },
            send : function(){
                //Futuro cambios a tiempo real. 
                //var blockypanel = document.getElementById("blocky-panel");
                //console.log(txt.innerHTML);
                var open = false;
                $('.loading-container').hide();
                if($('.screen-popup').is(':visible')){
                    open = true;
                    $('.screen-popup').hide();
                }
                html2canvas(document.querySelector("#workboard")).then(
                    canvas =>{
                        var img = canvas.toDataURL();
                        var data = {id : this.user.id, name : this.user.name+' '+this.user.flastname, img : img};
                        Echo.join('chat-team.'+ this.teamworkid)
                            .whisper('shareScreen', data);
                        CSLP.message.success('Desarrollo enviado correctamente');
                    })
                if(open == true){
                    $('.screen-popup').show();
                }
                   
            }
        }
    }
</script>
<style>
#imgScreen {
  border-radius: 5px;
  cursor: pointer;
  transition: 0.3s;
}

#imgScreen:hover {
    opacity: 0.9;
    }

/* The Modal (background) */
.modal-screen-zoom {
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 9; /* Sit on top */
  padding-top: 100px; /* Location of the box */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: rgb(0,0,0); /* Fallback color */
  background-color: rgba(0,0,0,0.9); /* Black w/ opacity */
}
.modal-screen-zoom img:hover{
    transform: scale(1.5);
    margin: auto;
}
/* Modal Content (image) */
.content-img-screen {
  margin: auto;
  display: block;
  width: 80%;
  max-width: 700px;
}

/* Caption of Modal Image */
#caption {
  margin: auto;
  display: block;
  width: 80%;
  max-width: 700px;
  text-align: center;
  color: #ccc;
  padding: 10px 0;
  height: 150px;
}

/* Add Animation */
.content-img-screen, #caption {  
  -webkit-animation-name: zoom;
  -webkit-animation-duration: 0.6s;
  animation-name: zoom;
  animation-duration: 0.6s;
}

@-webkit-keyframes zoom {
  from {-webkit-transform:scale(0)} 
  to {-webkit-transform:scale(1)}
}

@keyframes zoom {
  from {transform:scale(0)} 
  to {transform:scale(1)}
}

/* The Close Button */
.close {
  position: absolute;
  top: 15px;
  right: 35px;
  color: #f1f1f1;
  font-size: 40px;
  font-weight: bold;
  transition: 0.3s;
}

.close:hover,
.close:focus {
  color: #bbb;
  text-decoration: none;
  cursor: pointer;
}

/* 100% Image Width on Smaller Screens */
@media only screen and (max-width: 700px){
  .content-img-screen {
    width: 100%;
  }
}
.description-screen-share{
    color: white;
    font-size: medium;
    margin: 1rem;
}
.lider-title{
    color: white;
    font-size: medium;
    margin: 1rem;
    
}
.section-container{
    background-color: rgb(49, 48, 48);
    border-radius: 5px;
    opacity: 0.9;
    
}
.section-screen-team{
    padding: auto;
    overflow: scroll;
    height: 50rem;
    justify-content: flex-end;
    vertical-align: middle;
    margin: auto;
    max-height: 100%;
    max-width: 100%;

}
.section-screen-team .content-section-screen-team{
    border-color: #67bb6b;
    border-width: 2px;
    border-style: solid;
    margin: 1rem;
    background-color: #8bff91;
}
.section-screen-team strong{
    color: black;
}
.btn-live-lider{
    position: fixed;
    right:1rem;
    bottom: 12rem;
    background: rgb(35, 138, 52);
    color: white;
    width:60px;
    height: 60px;
    border-radius: 50%;
    opacity: 0.8;
    transition: opacity 0.3s;
    box-shadow: 0 5px 5px rgba(0,0,0,0.4);
    z-index: 10;
}
.btn-live-lider:hover{
    opacity: 1;
}
.btn-impr{
    position: fixed;
    right: 1em;
    bottom: 24.5rem;
    background: rgb(16, 65, 24);
    color: white;
    width:50px;
    height: 50px;
    border-radius: 50%;
    opacity: 0.8;
    box-shadow: 0 5px 5px rgba(0,0,0,0.4);
    z-index: 10;
}
.btn-impr:hover{
    opacity: 1;
}
.btn-view-share{
    position: fixed;
    right: 1em;
    bottom: 19rem;
    background: rgb(16, 65, 24);
    color: white;
    width:50px;
    height: 50px;
    border-radius: 50%;
    opacity: 0.8;
    box-shadow: 0 5px 5px rgba(0,0,0,0.4);
    z-index: 10;
}
.btn-view-share:hover{
    opacity: 1;
}
.screen-popup{
    width: 100%;
    height: 100%;
    position:fixed;
    top:0px;
    left:0px;
    z-index:9;
    display: flex;
    justify-content: center;
    align-items: center;
    
}
.screen-popup img{
    margin: auto;
    max-width: 100%;
    max-height: 100%;
    background-color: burlywood;
}
.screen-popup button{
    margin: auto;
    float: left;
}
.section-container{
    margin: 10px auto;
    width: 40%; 
    text-align: center;
    margin-top: 0%;

}
.badge-view-share{
    position: absolute;
    width: 20px;
    height: 20px;
    background-color: red;
    color:white;
    border-radius: 50%;
    display: flex;
    justify-content: center;
    align-items: center;
    top:-5px;
    right: -5px;
}
.badge-popup-button-parent{
    position: absolute;
    width: 30px;
    height: 30px;
    background-color: red;
    color:white;
    border-radius: 50%;
    display: flex;
    justify-content: center;
    align-items: center;
    top:-10px;
    right: -10px;
}
</style>