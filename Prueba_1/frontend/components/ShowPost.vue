<template>
    <div>
      <el-dialog
        title="Lista de posts"
        :visible.sync="visible"
        :before-close="hiddenDialog"
        width="70%">
        <el-row type="flex" :gutter="20">
          <el-col>
            <p>Datos</p>
            <div>
              <el-card align="center">
                <div>
                  <img :src="getUrlImage(user.id)" alt="">
                </div>
                <p>Nombre: {{ user.name }}</p>
                <p>Email: {{ user.email }}</p>
                <p>Username: {{ user.username }}</p>
              </el-card>
            </div>
          </el-col>
          <el-col>
            <p>Posts del usuario</p>
            <div class="list-post" v-loading="$fetchState.pending">
              <el-card v-for="post in posts"  v-bind:key="post.id">
                <p class="title"><b>Title: {{ post.title }}</b></p>
                <p>{{ post.body }}</p>
                <div>
                  <el-divider></el-divider>
                  Comentarios
                  <el-card v-for="comment in post.comments">
                    <p><i class="el-icon-user"></i> - <b>{{comment.name}}</b></p>
                    <p><i class="el-icon-user"></i> - {{comment.email}}</p>
                    <p>{{comment.body}}</p>
                  </el-card>
                </div>
              </el-card>
            </div>
          </el-col>
        </el-row>
        <span slot="footer" class="dialog-footer">
          <el-button @click="hiddenDialog">Cerrar</el-button>
        </span>
      </el-dialog>
    </div>
</template>

<script>
    export default {
        name: "ShowPost",
        props: ['visible'],
        methods:{
          hiddenDialog(){
            this.$emit('isHidden')
          },
          getUrlImage(id){
            return 'https://i.pravatar.cc/150?img='+id;
          }
        },
        data(){
            return{
              posts: [],
              user: {}
            }
        },
        async fetch(){
          this.user = this.$store.state.users.current_user
          this.posts = await this.$axios.$get(this.$config.MOCK_API + 'users/'+this.user.id+'/posts')
          for (const post of this.posts) {
            post.comments =  await this.$axios.$get(this.$config.MOCK_API + 'post/'+post.id+'/comments')
          }
        }
    }
</script>

<style lang="scss">
  .list-post{
    max-height: 350px;
    overflow-y: scroll;
    .el-card{
      margin-top: 15px;
    }
    .title{
      color: dodgerblue;
    }
  }
</style>
