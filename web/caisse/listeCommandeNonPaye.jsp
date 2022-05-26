<%-- 
    Document   : listeCommandeNonPaye
    Created on : 25 mai 2022, 16:12:05
    Author     : Manda
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.1/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.1/dist/js/bootstrap.bundle.min.js"></script>
        <title>Liste des commandes non payés</title>
    </head>
    <body>
        
        <nav class="navbar navbar-expand navbar-dark bg-dark" aria-label="Second navbar example">
            <div class="container-fluid">
                <a class="navbar-brand" href="Accueil">Serveur</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                        data-bs-target="#navbarsExample02" aria-controls="navbarsExample02"
                        aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarsExample02">
                    <ul class="navbar-nav me-auto">
                        <li class="nav-item">
                            <a class="nav-link" aria-current="page"
                               href="PageFormulaireInsertionCommande">Insertion de commande</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" aria-current="page"
                               href="VueCommandeNonPaye">Modification de commande</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" aria-current="page" href="VueProduitNonLivre">Livraison de produit</a>
                        </li>
                    </ul>
                </div>
                <div class="collapse navbar-collapse" id="">
                    <a class="btn btn-danger" href="Deconnection">Deconnection</a>
                </div>
            </div>
        </nav>
        
        <div class="container">
            
            <div class="row">
                <div class="col-12 text-center">
                    <h1>Commandes non payés</h1>
                </div>
            </div>
            
            <div class="row flex-lg-nowrap">
                <div class="col-12 col-lg-auto mb-3" style="width: 200px;">
                    <div class="card p-3">
                        <div class="e-navlist e-navlist--active-bg">
                            <ul class="nav">
                                <li class="nav-item"><a class="nav-link px-2 active" href="#"><i
                                            class="fa fa-fw fa-bar-chart mr-1"></i><span>Overview</span></a></li>
                                <li class="nav-item"><a class="nav-link px-2" href="https://www.bootdey.com/snippets/view/bs4-crud-users"
                                                        target="__blank"><i class="fa fa-fw fa-th mr-1"></i><span>CRUD</span></a></li>
                                <li class="nav-item"><a class="nav-link px-2"
                                                        href="https://www.bootdey.com/snippets/view/bs4-edit-profile-page" target="__blank"><i
                                            class="fa fa-fw fa-cog mr-1"></i><span>Settings</span></a></li>
                            </ul>
                        </div>
                    </div>
                </div>

                <div class="col">
                    <div class="e-tabs mb-3 px-3">
                        <ul class="nav nav-tabs">
                            <li class="nav-item"><a class="nav-link active" href="#">Users</a></li>
                        </ul>
                    </div>

                    <div class="row flex-lg-nowrap">
                        <div class="col mb-3">
                            <div class="e-panel card">
                                <div class="card-body">
                                    <div class="card-title">
                                        <h6 class="mr-2"><span>Users</span><small class="px-1">Be a wise leader</small></h6>
                                    </div>
                                    <div class="e-table">
                                        <div class="table-responsive table-lg mt-3">
                                            <table class="table table-bordered">
                                                <thead>
                                                    <tr>
                                                        <th class="align-top">
                                                            <div
                                                                class="custom-control custom-control-inline custom-checkbox custom-control-nameless m-0">
                                                                <input type="checkbox" class="custom-control-input" id="all-items">
                                                                <label class="custom-control-label" for="all-items"></label>
                                                            </div>
                                                        </th>
                                                        <th>Photo</th>
                                                        <th class="max-width">Name</th>
                                                        <th class="sortable">Date</th>
                                                        <th> </th>
                                                        <th>Actions</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td class="align-middle">
                                                            <div
                                                                class="custom-control custom-control-inline custom-checkbox custom-control-nameless m-0 align-top">
                                                                <input type="checkbox" class="custom-control-input" id="item-1">
                                                                <label class="custom-control-label" for="item-1"></label>
                                                            </div>
                                                        </td>
                                                        <td class="align-middle text-center">
                                                            <div class="bg-light d-inline-flex justify-content-center align-items-center align-top"
                                                                 style="width: 35px; height: 35px; border-radius: 3px;"><i class="fa fa-fw fa-photo"
                                                                                                                      style="opacity: 0.8;"></i></div>
                                                        </td>
                                                        <td class="text-nowrap align-middle">Adam Cotter</td>
                                                        <td class="text-nowrap align-middle"><span>09 Dec 2017</span></td>
                                                        <td class="text-center align-middle"><i
                                                                class="fa fa-fw text-secondary cursor-pointer fa-toggle-on"></i></td>
                                                        <td class="text-center align-middle">
                                                            <div class="btn-group align-top">
                                                                <button class="btn btn-sm btn-outline-secondary badge" type="button" data-toggle="modal"
                                                                        data-target="#user-form-modal">Edit</button>
                                                                <button class="btn btn-sm btn-outline-secondary badge" type="button"><i
                                                                        class="fa fa-trash"></i></button>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                </tbody>
                                            </table>
                                        </div>
                                        <div class="d-flex justify-content-center">
                                            <ul class="pagination mt-3 mb-0">
                                                <li class="disabled page-item"><a href="#" class="page-link">‹</a></li>
                                                <li class="active page-item"><a href="#" class="page-link">1</a></li>
                                                <li class="page-item"><a href="#" class="page-link">2</a></li>
                                                <li class="page-item"><a href="#" class="page-link">3</a></li>
                                                <li class="page-item"><a href="#" class="page-link">4</a></li>
                                                <li class="page-item"><a href="#" class="page-link">5</a></li>
                                                <li class="page-item"><a href="#" class="page-link">›</a></li>
                                                <li class="page-item"><a href="#" class="page-link">»</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-12 col-lg-3 mb-3">
                            <div class="card">
                                <div class="card-body">
                                    <div class="text-center px-xl-3">
                                        <button class="btn btn-success btn-block" type="button" data-toggle="modal"
                                                data-target="#user-form-modal">New User</button>
                                    </div>
                                    <hr class="my-3">
                                    <div class="e-navlist e-navlist--active-bold">
                                        <ul class="nav">
                                            <li class="nav-item active"><a href=""
                                                                           class="nav-link"><span>All</span>&nbsp;<small>/&nbsp;32</small></a></li>
                                            <li class="nav-item"><a href=""
                                                                    class="nav-link"><span>Active</span>&nbsp;<small>/&nbsp;16</small></a></li>
                                            <li class="nav-item"><a href=""
                                                                    class="nav-link"><span>Selected</span>&nbsp;<small>/&nbsp;0</small></a></li>
                                        </ul>
                                    </div>
                                    <hr class="my-3">
                                    <div>
                                        <div class="form-group">
                                            <label>Date from - to:</label>
                                            <div>
                                                <input id="dates-range" class="form-control flatpickr-input" placeholder="01 Dec 17 - 27 Jan 18"
                                                       type="text" readonly="readonly">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label>Search by Name:</label>
                                            <div><input class="form-control w-100" type="text" placeholder="Name" value=""></div>
                                        </div>
                                    </div>
                                    <hr class="my-3">
                                    <div class="">
                                        <label>Status:</label>
                                        <div class="px-2">
                                            <div class="custom-control custom-radio">
                                                <input type="radio" class="custom-control-input" name="user-status" id="users-status-disabled">
                                                <label class="custom-control-label" for="users-status-disabled">Disabled</label>
                                            </div>
                                        </div>
                                        <div class="px-2">
                                            <div class="custom-control custom-radio">
                                                <input type="radio" class="custom-control-input" name="user-status" id="users-status-active">
                                                <label class="custom-control-label" for="users-status-active">Active</label>
                                            </div>
                                        </div>
                                        <div class="px-2">
                                            <div class="custom-control custom-radio">
                                                <input type="radio" class="custom-control-input" name="user-status" id="users-status-any"
                                                       checked="">
                                                <label class="custom-control-label" for="users-status-any">Any</label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- User Form Modal -->
                    <div class="modal fade" role="dialog" tabindex="-1" id="user-form-modal">
                        <div class="modal-dialog modal-lg" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title">Create User</h5>
                                    <button type="button" class="close" data-dismiss="modal">
                                        <span aria-hidden="true">×</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <div class="py-1">
                                        <form class="form" novalidate="">
                                            <div class="row">
                                                <div class="col">
                                                    <div class="row">
                                                        <div class="col">
                                                            <div class="form-group">
                                                                <label>Full Name</label>
                                                                <input class="form-control" type="text" name="name" placeholder="John Smith"
                                                                       value="John Smith">
                                                            </div>
                                                        </div>
                                                        <div class="col">
                                                            <div class="form-group">
                                                                <label>Username</label>
                                                                <input class="form-control" type="text" name="username" placeholder="johnny.s"
                                                                       value="johnny.s">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col">
                                                            <div class="form-group">
                                                                <label>Email</label>
                                                                <input class="form-control" type="text" placeholder="user@example.com">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col mb-3">
                                                            <div class="form-group">
                                                                <label>About</label>
                                                                <textarea class="form-control" rows="5" placeholder="My Bio"></textarea>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-12 col-sm-6 mb-3">
                                                    <div class="mb-2"><b>Change Password</b></div>
                                                    <div class="row">
                                                        <div class="col">
                                                            <div class="form-group">
                                                                <label>Current Password</label>
                                                                <input class="form-control" type="password" placeholder="••••••">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col">
                                                            <div class="form-group">
                                                                <label>New Password</label>
                                                                <input class="form-control" type="password" placeholder="••••••">
                                                            </div>
                                                        </div>
                                                        <div class="col">
                                                            <div class="form-group">
                                                                <label>Confirm <span class="d-none d-xl-inline">Password</span></label>
                                                                <input class="form-control" type="password" placeholder="••••••">
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-12 col-sm-5 offset-sm-1 mb-3">
                                                    <div class="mb-2"><b>Keeping in Touch</b></div>
                                                    <div class="row">
                                                        <div class="col">
                                                            <label>Email Notifications</label>
                                                            <div class="custom-controls-stacked px-2">
                                                                <div class="custom-control custom-checkbox">
                                                                    <input type="checkbox" class="custom-control-input" id="notifications-blog" checked="">
                                                                    <label class="custom-control-label" for="notifications-blog">Blog posts</label>
                                                                </div>
                                                                <div class="custom-control custom-checkbox">
                                                                    <input type="checkbox" class="custom-control-input" id="notifications-news" checked="">
                                                                    <label class="custom-control-label" for="notifications-news">Newsletter</label>
                                                                </div>
                                                                <div class="custom-control custom-checkbox">
                                                                    <input type="checkbox" class="custom-control-input" id="notifications-offers"
                                                                           checked="">
                                                                    <label class="custom-control-label" for="notifications-offers">Personal Offers</label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col d-flex justify-content-end">
                                                    <button class="btn btn-primary" type="submit">Save Changes</button>
                                                </div>
                                            </div>
                                        </form>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <style type="text/css">
            body {
                margin-top: 20px;
                background: #f8f8f8
            }
        </style>

        <script type="text/javascript">

        </script>

    </body>
</html>
