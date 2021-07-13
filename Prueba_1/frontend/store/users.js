export const state = () => ({
  current_user: {}
})

export const mutations = {
  setCurrentUser(state, current_user){
    state.current_user = current_user
  }
}
