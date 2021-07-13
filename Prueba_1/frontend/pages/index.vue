<template>
  <div class="container">
    <NavBar></NavBar>
    <TableUsers :users="users" @showTodo="showTodo" @showPost="showPost"></TableUsers>
    <ShowPost :visible="visiblePost" @isHidden="hiddenPost" v-if="visiblePost"></ShowPost>
    <ShowTodo :visible="visibleTodo" @isHidden="hiddenTodo" v-if="visibleTodo"></ShowTodo>
  </div>
</template>

<script>

import ShowPost from "../components/ShowPost";
export default {
  components: {ShowPost},
  data(){
    return{
      users: [],
      user: {},
      visiblePost: false,
      visibleTodo: false
    }
  },
  methods: {
    // Get all users
    async getUsers() {
      this.users = await this.$axios.$get(this.$config.MOCK_API + 'users')
    },
    showTodo(){
      this.visibleTodo = true;
      this.visiblePost = false;
    },
    showPost(){
      this.visiblePost = true;
      this.visibleTodo = false;
    },
    hiddenPost(){
      this.visiblePost = false;
    },
    hiddenTodo(){
      this.visibleTodo = false;
    }
  },
  async fetch(){
    await this.getUsers();
  }
}
</script>
