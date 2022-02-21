<template>
    <div>
        <Breadcrumbs title="Статья" :items="breadcrumbsItems"/>

        <!-- begin:: Content -->
        <div class="kt-container  kt-container--fluid  kt-grid__item kt-grid__item--fluid">
            <div class="row">
                <div class="col-md-12">
                    <!--begin::Form-->
                    <form class="kt-form" role="form" @submit.prevent="updateArticle" v-loading="loading">
                        <div class="card">

                            <div class="card-body">
                                <div class="row">

                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Seo заголовок</label>
                                            <input type="text" v-model="article.seo_title" class="form-control"
                                                   placeholder="">
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group form-group-last">
                                            <label>Seo описание</label>
                                            <textarea class="form-control" v-model="article.meta_description"
                                                      rows="4"></textarea>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group form-group-last">
                                            <label>Seo ключевые слова</label>
                                            <textarea class="form-control" v-model="article.meta_keyword"
                                                      rows="4"></textarea>
                                        </div>
                                    </div>

                                </div>


                                <div class="row mt-5">
                                    <div class="col-md-12">
                                        <div class="form-group form-group-last">
                                            <label>Текст</label>
                                            <quill-editor
                                                    v-model="article.text"
                                                    :options="editorOption">
                                            </quill-editor>
                                        </div>


                                        <div class="form-group form-group-last mt-5">
                                            <label>ID товаров</label>
                                            <input class="form-control" v-model="article.products"
                                                   placeholder="Начните вводить ID товаров через запятую"/>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group col-md-12">
                                <div class="kt-portlet__foot d-flex">
                                    <div class="kt-form__actions" v-loading="loading">
                                        <button type="submit" class="btn btn-primary">Сохранить</button>
                                    </div>
                                    <div class="kt-form__actions ml-5" v-loading="loading">
                                        <button type="button" class="btn btn-danger" @click="deleteArticle">Удалить</button>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</template>


<script>
    import Breadcrumbs from '~/components/Breadcrumbs.vue'

    import {quillEditor} from 'vue-quill-editor'
    import 'quill/dist/quill.core.css'
    import 'quill/dist/quill.snow.css'
    import 'quill/dist/quill.bubble.css'

    export default {
        middleware: 'auth',
        components: {
            Breadcrumbs, quillEditor
        },
        data() {
            return {
                breadcrumbsItems: [
                    {
                        title: 'Категории',
                        name: 'categories'
                    },
                    {
                        title: 'Редактирование статьи',
                        path: '/articles/create',
                        params: 'category_id: ' + this.$route.query.category_id,
                    }
                ],
                article: {
                    seo_title: '',
                    meta_description: '',
                    meta_keyword: '',
                    text: '',
                    products: '',
                    category_id: this.$route.query.category_id
                },
                loading: false,
                editorOption: {}
            }
        },

        async fetch() {
            await this.getArticle();
        },

        methods: {
            async getArticle() {
                const response = await this.$axios.get(process.env.apiWebUrl + `/adm/articles/${this.$route.query.category_id}`);
                if(response.data.data) {
                    this.article = response.data.data;
                }
            },

            async updateArticle() {
                this.loading = true;
                this.$axios.patch(process.env.apiWebUrl + `/adm/articles/${this.$route.query.category_id}/update`, {
                    article: this.article
                })
                    .then(response => {
                        let status = response.data.data;
                        if (status.status === 'success') {
                            this.$message({
                                showClose: true,
                                message: 'Успешно обновлено',
                                type: 'success',
                                center: true
                            });
                        }
                    })
                    .catch(error =>
                        this.errors.record(error.response.data)
                    )
                    .finally(() => {
                        this.loading = false;
                    });
            },

            async deleteArticle() {
                this.loading = true;
                const response = await this.$axios.get(process.env.apiWebUrl + `/adm/articles/${this.$route.query.category_id}/delete`);
                if(response) {
                    this.article = {
                        seo_title: '',
                        meta_description: '',
                        meta_keyword: '',
                        text: '',
                        products: '',
                        category_id: this.$route.query.category_id
                    }
                }
                this.loading = false;
            }
        }

    }
</script>
