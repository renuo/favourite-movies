<template>
  <div id="app">
    <input v-model="message" @change="callAPI" placeholder="Search...">
    <p>Message is: {{ message }}</p>

    <p>Response is: {{ response }}</p>
  </div>
</template>

<script>
export default {
  data: function () {
    return {
      message: '',
      response: ''
    }
  },
  methods: {
    callAPI() {
        var search_term = this.message;

        axios
          .get(`http://www.omdbapi.com/?apikey=6499c791&s=${search_term}`)
          .then(response => (this.response = response))
    }
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
