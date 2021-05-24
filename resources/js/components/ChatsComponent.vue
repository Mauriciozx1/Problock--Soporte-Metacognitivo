<template>
   <div class="row">
       <button @click="onPopup" id="btn-chat-popup" class="btn-chat" > 
                    <div class="badge" v-if="notificationChat > 0">{{notificationChat}}</div>
                    <i class="material-icons"> comment </i>
            </button>
        <div id="chat-popup" class="chat-popup">
            <div id="texto-on" @click="viewUsers" class="texto-on" style="text-align: center;">
                <strong >Ver usuarios online</strong>
                <span v-if="openViewUser == false" class="material-icons">
                    expand_more
                </span>
                <span v-if="openViewUser == true" class="material-icons">
                    expand_less
                </span>
                </div>
            <div class="chat-user-active" v-if="openViewUser == true">
                <div class="intergers-list" v-for="(user, index) in users" :key="index">
                    <div id="btn-user" class="btn-user" > 
                        <span class="material-icons" >person</span>
                        <span class="text-hover">{{user.name}}</span>
                    </div>
                    <div class="user-text-hover">
                        
                    </div>

                </div>      
            </div>
            <div class="chat-body">
                <div class="title-chat"><strong>Mensajes</strong></div>
                    <div class="list-unstyled" style="height:300px; overflow-y:scroll" v-chat-scroll>
                        <div class="p-2" v-for="(message, index) in messages" :key="index">
                            <div v-if="message.user.id != user.id" class="message-interger">
                                <section class="section-name-interger"><strong>{{ message.user.name }}</strong></section>
                                    {{ message.message }}
                            </div>
                            <div v-if="message.user.id == user.id" class="mymessage">
                                <section class="section-i"><strong>Yo</strong></section>
                                    {{ message.message }}
                            </div>
                            
                        </div>
                    </div>
                    <span class="text-muted" v-if="activeUser" >{{ activeUser.name }} esta escribiendo...</span>
                
            </div>
            <input
                    @keydown="sendTypingEvent"
                    @keyup.enter="sendMessage"
                    v-model="newMessage"
                    type="text"
                    name="message"
                    placeholder="Ingresa tu mensaje y presiona enter..."
                    class="form-control">
        </div>
   </div>
</template>

<script>
    export default {
        props:{
            user: this.user,
            teamworkid: this.teamworkid,
        },
        
        data() {
            return {
                messages: [],
                newMessage: '',
                users:[],
                activeUser: false,
                typingTimer: false,
                isOpen: false,
                notificationChat : 0,
                openViewUser : false
            }
        },

        created() {
            this.fetchMessages();
            Echo.join('chat-team.'+this.teamworkid)
                .listen('.message.send',(e) => {
                    this.notificationChat++;
                    this.messages.push(e.message);
                    
                })
                .here(user => {
                    this.users = user;
                })
                .joining(user => {
                    this.users.push(user);
                })
                .leaving(user => {
                    this.users = this.users.filter(u => u.id != user.id);
                })
                .listenForWhisper('typing', user => {
                    this.activeUser = user;
                    if(this.typingTimer) {
                        clearTimeout(this.typingTimer);
                    }
                    
                    this.typingTimer = setTimeout(() => {
                       this.activeUser = false;
                   }, 2000);
                })
                
        },

        methods: {
            viewUsers : function(){
                if(this.openViewUser == true){
                    this.openViewUser = false;
                }else{
                    this.openViewUser = true;
                }
            },
            onPopup : function(){
                this.notificationChat = 0;
              
            },
            fetchMessages() {
                console.log('Render');
                axios.get('/fmessages/'+this.teamworkid).then(response => {
                    this.messages = response.data;
                })
            },

            sendMessage() {
                console.log('He enviado!');
                this.messages.push({
                    user: this.user,
                    message: this.newMessage
                });

                axios.post('/smessages', {message: this.newMessage, teamworkid: this.teamworkid});
                this.newMessage = '';
                
            },

            sendTypingEvent() {
                Echo.join('chat-team.'+this.teamworkid)
                    .whisper('typing', this.user);
            },
            toggle: function(){
                this.isOpen = !this.isOpen;
            }
        }
    }
</script>
<style>

.chat-user-active{
    display: inline-flex;
    align-content: center;
    background: white;
    
}
.intergers-list{
    align-items: center;
    align-content: center;
}
.btn-user{
    cursor: pointer;
    background-color: rgb(76, 165, 76);
    -webkit-border-radius:50%;
    border-radius:50%;
    padding: 1rem;
    margin: 0.5rem;
}
.btn-user:hover{
    opacity: 0.65;

}
.btn-user:hover .text-hover{
    visibility: visible;
}
.btn-user .text-hover{
    width: 120px;
    bottom: 100%;
    left: 50%;
    margin-left: -60px;
    visibility: hidden;
    background-color: black;
    color: #fff;
    text-align: center;
    padding: 5px 0;
    border-radius: 6px;
 
  /* Position the tooltip text - see examples below! */
  position: absolute;
  z-index: 1;
}

.btn-chat{
    position: fixed;
    right:1rem;
    bottom: 50px;
    background: rgb(35, 138, 52);
    color: white;
    width:60px;
    height: 60px;
    border-radius: 50%;
    opacity: 0.8;
    transition: opacity 0.3s;
    box-shadow: 0 5px 5px rgba(0,0,0,0.4);
    z-index: 13;
}
.btn-chat:hover{
    opacity: 1;
}

.chat-popup{
    display: none;
    position: fixed;
    bottom:80px;
    right:120px;
    max-height: 100%;
    width: 300px;
    background-color: rgb(255, 255, 255);
    /* display: flex; */
    flex-direction: column;
    justify-content: space-between;
    
    box-shadow: 5px 5px 5px rgba(0,0,0,0.4);
    border: 2px solid rgb(28, 107, 41);
    border-radius: 10px;
    z-index: 13;
    margin: 0.75rem;
}
.list-unstyled{
    margin:0;
    padding:0;
}
.p-2{
    list-style: none;
    justify-content: flex-end;
    margin: 0.75rem;
    padding: 0.5rem;
}
.text-muted{
    text-align: center;
}
.show{
    display: flex;
}
.texto-on{
    color: white ;
    background: rgb(35, 138, 52);
    border: 2px solid rgb(35, 138, 52);
    border-radius: 6px 6px 0px 0px;
    cursor: pointer;
}
.title-chat{
    text-align: center;
    color: white ;
    background: rgb(35, 138, 52);
    border: 2px solid rgb(35, 138, 52);
}
.badge{
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

.input-area{
    position: relative;
    display: flex;
    justify-content: center;
}

input[type="text"]{
    width:100%;
    border: 1px solid #ccc;
    font-size: 1rem;
    height: 3rem;
}


.message-interger{
    justify-content: flex-end;
    text-align: right;
    align-items: right;
    margin:auto;
    padding: 1rem;
    background-color: rgb(246, 255, 167);
    box-shadow: 0 2px 5px rgba(0,0,0,0.4);
    word-break: break-all;
}

.mymessage{
    justify-content: flex-end;
    margin: auto;
    background-color: rgb(180, 255, 180);
    box-shadow: 0 2px 5px rgba(0,0,0,0.4);
    word-break: break-all;
    padding: 1rem;
}
.mymessage strong{
    text-align: left;
}
@media (max-width:500px){

    .chat-popup{
        bottom: 120px;
        right:10%;
        width: 80vw;
    }
}</style>