sidebarNodes={"extras":[{"id":"api-reference","title":"API Reference","group":"","headers":[{"id":"Modules","anchor":"modules"}]},{"id":"readme","title":"MinqaApi","group":"","headers":[{"id":"Learn more","anchor":"learn-more"}]},{"id":"custom_page","title":"Como usar el API","group":"","headers":[{"id":"Generar el token","anchor":"generar-el-token"},{"id":"Obtener cuentas bancarias","anchor":"obtener-cuentas-bancarias"}]}],"exceptions":[],"modules":[{"id":"MinqaApi","title":"MinqaApi","group":""},{"id":"MinqaApi.Application","title":"MinqaApi.Application","group":"","functions":[{"id":"config_change/3","anchor":"config_change/3"},{"id":"start/2","anchor":"start/2"}]},{"id":"MinqaApi.Auth","title":"MinqaApi.Auth","group":"","functions":[{"id":"aplicacion_register/1","anchor":"aplicacion_register/1"},{"id":"authenticate_aplicacion/2","anchor":"authenticate_aplicacion/2"},{"id":"change_aplicacion/1","anchor":"change_aplicacion/1"},{"id":"change_register_aplicacion/1","anchor":"change_register_aplicacion/1"},{"id":"create_aplicacion/1","anchor":"create_aplicacion/1"},{"id":"delete_aplicacion/1","anchor":"delete_aplicacion/1"},{"id":"generate_jwt/1","anchor":"generate_jwt/1"},{"id":"get_aplicacion!/1","anchor":"get_aplicacion!/1"},{"id":"list_aplicaciones/0","anchor":"list_aplicaciones/0"},{"id":"login/2","anchor":"login/2"},{"id":"logout/1","anchor":"logout/1"},{"id":"update_aplicacion/2","anchor":"update_aplicacion/2"}]},{"id":"MinqaApi.Auth.AccessApiPipeline.LoadCurrentAplicacion","title":"MinqaApi.Auth.AccessApiPipeline.LoadCurrentAplicacion","group":"","functions":[{"id":"call/2","anchor":"call/2"},{"id":"init/1","anchor":"init/1"}]},{"id":"MinqaApi.Auth.AccessHtmlPipeline.LoadCurrentAplicacion","title":"MinqaApi.Auth.AccessHtmlPipeline.LoadCurrentAplicacion","group":"","functions":[{"id":"call/2","anchor":"call/2"},{"id":"init/1","anchor":"init/1"}]},{"id":"MinqaApi.Auth.Aplicacion","title":"MinqaApi.Auth.Aplicacion","group":"","functions":[{"id":"changeset/2","anchor":"changeset/2"}]},{"id":"MinqaApi.Auth.Guardian","title":"MinqaApi.Auth.Guardian","group":"","functions":[{"id":"after_encode_and_sign/4","anchor":"after_encode_and_sign/4"},{"id":"after_sign_in/5","anchor":"after_sign_in/5"},{"id":"before_sign_out/3","anchor":"before_sign_out/3"},{"id":"build_claims/3","anchor":"build_claims/3"},{"id":"config/0","anchor":"config/0"},{"id":"config/2","anchor":"config/2"},{"id":"decode_and_verify/3","anchor":"decode_and_verify/3"},{"id":"default_token_type/0","anchor":"default_token_type/0"},{"id":"encode_and_sign/3","anchor":"encode_and_sign/3"},{"id":"exchange/4","anchor":"exchange/4"},{"id":"on_exchange/3","anchor":"on_exchange/3"},{"id":"on_refresh/3","anchor":"on_refresh/3"},{"id":"on_revoke/3","anchor":"on_revoke/3"},{"id":"on_verify/3","anchor":"on_verify/3"},{"id":"peek/1","anchor":"peek/1"},{"id":"refresh/2","anchor":"refresh/2"},{"id":"resource_from_claims/1","anchor":"resource_from_claims/1"},{"id":"resource_from_token/3","anchor":"resource_from_token/3"},{"id":"revoke/2","anchor":"revoke/2"},{"id":"subject_for_token/2","anchor":"subject_for_token/2"},{"id":"verify_claims/2","anchor":"verify_claims/2"}]},{"id":"MinqaApi.Auth.Guardian.Plug","title":"MinqaApi.Auth.Guardian.Plug","group":"","functions":[{"id":"authenticated?/2","anchor":"authenticated?/2"},{"id":"current_claims/2","anchor":"current_claims/2"},{"id":"current_resource/2","anchor":"current_resource/2"},{"id":"current_token/2","anchor":"current_token/2"},{"id":"implementation/0","anchor":"implementation/0"},{"id":"put_current_claims/3","anchor":"put_current_claims/3"},{"id":"put_current_resource/3","anchor":"put_current_resource/3"},{"id":"put_current_token/3","anchor":"put_current_token/3"},{"id":"sign_in/4","anchor":"sign_in/4"},{"id":"sign_out/2","anchor":"sign_out/2"}]},{"id":"MinqaApi.Bank","title":"MinqaApi.Bank","group":"","functions":[{"id":"account_register/1","anchor":"account_register/1"},{"id":"authenticate_account/2","anchor":"authenticate_account/2"},{"id":"change_account/1","anchor":"change_account/1"},{"id":"change_cuenta/1","anchor":"change_cuenta/1"},{"id":"change_register_aplicacion/1","anchor":"change_register_aplicacion/1"},{"id":"create_account/1","anchor":"create_account/1"},{"id":"create_cuenta/1","anchor":"create_cuenta/1"},{"id":"delete_account/1","anchor":"delete_account/1"},{"id":"delete_cuenta/1","anchor":"delete_cuenta/1"},{"id":"get_account!/1","anchor":"get_account!/1"},{"id":"get_cuenta!/1","anchor":"get_cuenta!/1"},{"id":"list_accounts/0","anchor":"list_accounts/0"},{"id":"list_cuentas/0","anchor":"list_cuentas/0"},{"id":"pago/4","anchor":"pago/4"},{"id":"preload_cuentas/1","anchor":"preload_cuentas/1"},{"id":"update_account/2","anchor":"update_account/2"},{"id":"update_cuenta/2","anchor":"update_cuenta/2"}]},{"id":"MinqaApi.Bank.Account","title":"MinqaApi.Bank.Account","group":""},{"id":"MinqaApi.Bank.Cuenta","title":"MinqaApi.Bank.Cuenta","group":""},{"id":"MinqaApi.Repo","title":"MinqaApi.Repo","group":"","functions":[{"id":"aggregate/4","anchor":"aggregate/4"},{"id":"all/2","anchor":"all/2"},{"id":"child_spec/1","anchor":"child_spec/1"},{"id":"config/0","anchor":"config/0"},{"id":"delete/2","anchor":"delete/2"},{"id":"delete!/2","anchor":"delete!/2"},{"id":"delete_all/2","anchor":"delete_all/2"},{"id":"get/3","anchor":"get/3"},{"id":"get!/3","anchor":"get!/3"},{"id":"get_by/3","anchor":"get_by/3"},{"id":"get_by!/3","anchor":"get_by!/3"},{"id":"in_transaction?/0","anchor":"in_transaction?/0"},{"id":"init/2","anchor":"init/2"},{"id":"insert/2","anchor":"insert/2"},{"id":"insert!/2","anchor":"insert!/2"},{"id":"insert_all/3","anchor":"insert_all/3"},{"id":"insert_or_update/2","anchor":"insert_or_update/2"},{"id":"insert_or_update!/2","anchor":"insert_or_update!/2"},{"id":"load/2","anchor":"load/2"},{"id":"one/2","anchor":"one/2"},{"id":"one!/2","anchor":"one!/2"},{"id":"preload/3","anchor":"preload/3"},{"id":"query/3","anchor":"query/3"},{"id":"query!/3","anchor":"query!/3"},{"id":"rollback/1","anchor":"rollback/1"},{"id":"start_link/1","anchor":"start_link/1"},{"id":"stop/2","anchor":"stop/2"},{"id":"stream/2","anchor":"stream/2"},{"id":"to_sql/2","anchor":"to_sql/2"},{"id":"transaction/2","anchor":"transaction/2"},{"id":"update/2","anchor":"update/2"},{"id":"update!/2","anchor":"update!/2"},{"id":"update_all/3","anchor":"update_all/3"}]},{"id":"MinqaApiWeb","title":"MinqaApiWeb","group":"","functions":[{"id":"__using__/1","anchor":"__using__/1"},{"id":"channel/0","anchor":"channel/0"},{"id":"controller/0","anchor":"controller/0"},{"id":"router/0","anchor":"router/0"},{"id":"view/0","anchor":"view/0"}]},{"id":"MinqaApiWeb.AccountController","title":"MinqaApiWeb.AccountController","group":"","functions":[{"id":"show/2","anchor":"show/2"}]},{"id":"MinqaApiWeb.AccountView","title":"MinqaApiWeb.AccountView","group":"","functions":[{"id":"__phoenix_recompile__?/0","anchor":"__phoenix_recompile__?/0"},{"id":"__resource__/0","anchor":"__resource__/0"},{"id":"__templates__/0","anchor":"__templates__/0"},{"id":"render/2","anchor":"render/2"},{"id":"template_not_found/2","anchor":"template_not_found/2"}]},{"id":"MinqaApiWeb.ChangesetView","title":"MinqaApiWeb.ChangesetView","group":"","functions":[{"id":"__phoenix_recompile__?/0","anchor":"__phoenix_recompile__?/0"},{"id":"__resource__/0","anchor":"__resource__/0"},{"id":"__templates__/0","anchor":"__templates__/0"},{"id":"render/2","anchor":"render/2"},{"id":"template_not_found/2","anchor":"template_not_found/2"},{"id":"translate_errors/1","anchor":"translate_errors/1"}]},{"id":"MinqaApiWeb.CuentaController","title":"MinqaApiWeb.CuentaController","group":"","functions":[{"id":"pago/2","anchor":"pago/2"}]},{"id":"MinqaApiWeb.CuentaView","title":"MinqaApiWeb.CuentaView","group":"","functions":[{"id":"__phoenix_recompile__?/0","anchor":"__phoenix_recompile__?/0"},{"id":"__resource__/0","anchor":"__resource__/0"},{"id":"__templates__/0","anchor":"__templates__/0"},{"id":"render/2","anchor":"render/2"},{"id":"template_not_found/2","anchor":"template_not_found/2"}]},{"id":"MinqaApiWeb.Endpoint","title":"MinqaApiWeb.Endpoint","group":"","functions":[{"id":"__sockets__/0","anchor":"__sockets__/0"},{"id":"broadcast/3","anchor":"broadcast/3"},{"id":"broadcast!/3","anchor":"broadcast!/3"},{"id":"broadcast_from/4","anchor":"broadcast_from/4"},{"id":"broadcast_from!/4","anchor":"broadcast_from!/4"},{"id":"call/2","anchor":"call/2"},{"id":"config/2","anchor":"config/2"},{"id":"config_change/2","anchor":"config_change/2"},{"id":"host/0","anchor":"host/0"},{"id":"init/1","anchor":"init/1"},{"id":"init/2","anchor":"init/2"},{"id":"instrument/3","anchor":"instrument/3"},{"id":"path/1","anchor":"path/1"},{"id":"script_name/0","anchor":"script_name/0"},{"id":"start_link/1","anchor":"start_link/1"},{"id":"static_path/1","anchor":"static_path/1"},{"id":"static_url/0","anchor":"static_url/0"},{"id":"struct_url/0","anchor":"struct_url/0"},{"id":"subscribe/1","anchor":"subscribe/1"},{"id":"subscribe/3","anchor":"subscribe/3"},{"id":"unsubscribe/1","anchor":"unsubscribe/1"},{"id":"url/0","anchor":"url/0"}]},{"id":"MinqaApiWeb.ErrorHelpers","title":"MinqaApiWeb.ErrorHelpers","group":"","functions":[{"id":"error_tag/2","anchor":"error_tag/2"},{"id":"translate_error/1","anchor":"translate_error/1"}]},{"id":"MinqaApiWeb.ErrorView","title":"MinqaApiWeb.ErrorView","group":"","functions":[{"id":"__phoenix_recompile__?/0","anchor":"__phoenix_recompile__?/0"},{"id":"__resource__/0","anchor":"__resource__/0"},{"id":"__templates__/0","anchor":"__templates__/0"},{"id":"render/2","anchor":"render/2"},{"id":"template_not_found/2","anchor":"template_not_found/2"}]},{"id":"MinqaApiWeb.FallbackController","title":"MinqaApiWeb.FallbackController","group":""},{"id":"MinqaApiWeb.Gettext","title":"MinqaApiWeb.Gettext","group":"","functions":[{"id":"dgettext/3","anchor":"dgettext/3"},{"id":"dgettext_noop/2","anchor":"dgettext_noop/2"},{"id":"dngettext/5","anchor":"dngettext/5"},{"id":"dngettext_noop/3","anchor":"dngettext_noop/3"},{"id":"gettext/2","anchor":"gettext/2"},{"id":"gettext_comment/1","anchor":"gettext_comment/1"},{"id":"gettext_noop/1","anchor":"gettext_noop/1"},{"id":"handle_missing_bindings/2","anchor":"handle_missing_bindings/2"},{"id":"lgettext/4","anchor":"lgettext/4"},{"id":"lngettext/6","anchor":"lngettext/6"},{"id":"ngettext/4","anchor":"ngettext/4"},{"id":"ngettext_noop/2","anchor":"ngettext_noop/2"}]},{"id":"MinqaApiWeb.LayoutView","title":"MinqaApiWeb.LayoutView","group":"","functions":[{"id":"__phoenix_recompile__?/0","anchor":"__phoenix_recompile__?/0"},{"id":"__resource__/0","anchor":"__resource__/0"},{"id":"__templates__/0","anchor":"__templates__/0"},{"id":"render/2","anchor":"render/2"},{"id":"template_not_found/2","anchor":"template_not_found/2"}]},{"id":"MinqaApiWeb.PageController","title":"MinqaApiWeb.PageController","group":"","functions":[{"id":"api/2","anchor":"api/2"},{"id":"index/2","anchor":"index/2"}]},{"id":"MinqaApiWeb.PageView","title":"MinqaApiWeb.PageView","group":"","functions":[{"id":"__phoenix_recompile__?/0","anchor":"__phoenix_recompile__?/0"},{"id":"__resource__/0","anchor":"__resource__/0"},{"id":"__templates__/0","anchor":"__templates__/0"},{"id":"render/2","anchor":"render/2"},{"id":"template_not_found/2","anchor":"template_not_found/2"}]},{"id":"MinqaApiWeb.Router","title":"MinqaApiWeb.Router","group":"","functions":[{"id":"api/2","anchor":"api/2"},{"id":"auth_html/2","anchor":"auth_html/2"},{"id":"browser/2","anchor":"browser/2"},{"id":"call/2","anchor":"call/2"},{"id":"ensure_api_auth/2","anchor":"ensure_api_auth/2"},{"id":"ensure_html_auth/2","anchor":"ensure_html_auth/2"},{"id":"init/1","anchor":"init/1"}]},{"id":"MinqaApiWeb.Router.Helpers","title":"MinqaApiWeb.Router.Helpers","group":"","functions":[{"id":"account_path/2","anchor":"account_path/2"},{"id":"account_path/3","anchor":"account_path/3"},{"id":"account_url/2","anchor":"account_url/2"},{"id":"account_url/3","anchor":"account_url/3"},{"id":"cuenta_path/2","anchor":"cuenta_path/2"},{"id":"cuenta_path/3","anchor":"cuenta_path/3"},{"id":"cuenta_url/2","anchor":"cuenta_url/2"},{"id":"cuenta_url/3","anchor":"cuenta_url/3"},{"id":"page_path/2","anchor":"page_path/2"},{"id":"page_path/3","anchor":"page_path/3"},{"id":"page_url/2","anchor":"page_url/2"},{"id":"page_url/3","anchor":"page_url/3"},{"id":"path/2","anchor":"path/2"},{"id":"session_api_path/2","anchor":"session_api_path/2"},{"id":"session_api_path/3","anchor":"session_api_path/3"},{"id":"session_api_url/2","anchor":"session_api_url/2"},{"id":"session_api_url/3","anchor":"session_api_url/3"},{"id":"session_path/2","anchor":"session_path/2"},{"id":"session_path/3","anchor":"session_path/3"},{"id":"session_url/2","anchor":"session_url/2"},{"id":"session_url/3","anchor":"session_url/3"},{"id":"static_path/2","anchor":"static_path/2"},{"id":"static_url/2","anchor":"static_url/2"},{"id":"url/1","anchor":"url/1"}]},{"id":"MinqaApiWeb.SessionApiController","title":"MinqaApiWeb.SessionApiController","group":"","functions":[{"id":"create/2","anchor":"create/2"}]},{"id":"MinqaApiWeb.SessionApiView","title":"MinqaApiWeb.SessionApiView","group":"","functions":[{"id":"__phoenix_recompile__?/0","anchor":"__phoenix_recompile__?/0"},{"id":"__resource__/0","anchor":"__resource__/0"},{"id":"__templates__/0","anchor":"__templates__/0"},{"id":"render/2","anchor":"render/2"},{"id":"template_not_found/2","anchor":"template_not_found/2"}]},{"id":"MinqaApiWeb.SessionController","title":"MinqaApiWeb.SessionController","group":"","functions":[{"id":"create/2","anchor":"create/2"},{"id":"delete/2","anchor":"delete/2"},{"id":"new/2","anchor":"new/2"}]},{"id":"MinqaApiWeb.SessionView","title":"MinqaApiWeb.SessionView","group":"","functions":[{"id":"__phoenix_recompile__?/0","anchor":"__phoenix_recompile__?/0"},{"id":"__resource__/0","anchor":"__resource__/0"},{"id":"__templates__/0","anchor":"__templates__/0"},{"id":"render/2","anchor":"render/2"},{"id":"template_not_found/2","anchor":"template_not_found/2"}]},{"id":"MinqaApiWeb.UserSocket","title":"MinqaApiWeb.UserSocket","group":"","functions":[{"id":"connect/2","anchor":"connect/2"},{"id":"id/1","anchor":"id/1"}]}],"tasks":[]}