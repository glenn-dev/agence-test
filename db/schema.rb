# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 0) do

  create_table "cao_acompanhamento_sistema", primary_key: "co_acompanhamento", id: :integer, unsigned: true, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "email", limit: 40
    t.string "senha", limit: 20
    t.bigint "co_sistema", default: 0
    t.string "status", limit: 2
  end

  create_table "cao_agendamento", primary_key: "co_agendamento", id: :bigint, unsigned: true, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.datetime "dt_hr_inicio", null: false
    t.datetime "dt_hr_fim"
    t.bigint "co_status_agendamento", default: 0, null: false
    t.bigint "co_diary_report_consultor", default: 0, null: false
    t.bigint "co_complemento", default: 0, null: false
  end

  create_table "cao_arquitetura_os", primary_key: "co_arquitetura", id: :bigint, default: 0, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "ds_arquitetura", limit: 20, default: "", null: false
  end

  create_table "cao_atividade", primary_key: "co_atividade", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "ds_atividade", limit: 30, default: "", null: false
    t.bigint "co_tipo_usuario", default: 0, null: false
  end

  create_table "cao_atividade_consultor", primary_key: "co_atividade", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "ds_atividade", limit: 50, default: "", null: false
    t.string "ativo", limit: 1
  end

  create_table "cao_atividade_report", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.integer "co_cliente", default: 0, null: false
    t.string "inicio", limit: 30
    t.string "fim", limit: 30
    t.string "lembrete", limit: 50
    t.integer "co_atividade", default: 0, null: false
    t.integer "co_os", default: 0, null: false
    t.string "assunto", limit: 60
    t.text "conteudo"
    t.string "status", limit: 20, default: "", null: false
    t.string "tempo", limit: 30
    t.string "co_usuario", limit: 50, default: "", null: false
    t.datetime "data_ativ", null: false
    t.text "retorno", null: false
    t.integer "co_fase", default: 0
  end

  create_table "cao_atividade_teste", primary_key: "co_atividade", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "ds_atividade", limit: 30, default: "", null: false
    t.bigint "co_tipo_usuario", default: 0, null: false
  end

  create_table "cao_aviso", primary_key: "co_aviso", id: :integer, unsigned: true, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.text "ds_aviso", null: false
  end

  create_table "cao_banco_de_horas", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "co_usuario", default: "", null: false, collation: "utf8_general_ci"
    t.date "data_cadastro", null: false
    t.integer "segundos", default: 0, null: false
    t.string "tipo", limit: 10, default: "", null: false, collation: "utf8_general_ci"
  end

  create_table "cao_banco_horas", primary_key: "co_banc_horas", id: :integer, unsigned: true, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1", comment: "Banco de horas dos usuários...", force: :cascade do |t|
    t.string "co_usuario", limit: 20, default: "", null: false
    t.string "periodo", limit: 7, default: "", null: false
    t.integer "min_mes", default: 0, null: false
    t.integer "min_ferias", default: 0, null: false
    t.integer "min_pago", default: 0, null: false
    t.integer "min_total", default: 0, null: false
  end

  create_table "cao_boleto", primary_key: "co_boleto", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.integer "co_cliente", default: 0, null: false
    t.integer "co_sistema", default: 0, null: false
    t.integer "co_os", default: 0, null: false
    t.string "valor", limit: 128, default: "", null: false
    t.string "vencimento", limit: 128, default: "", null: false
    t.integer "status", default: 0, null: false
    t.string "boleto"
    t.string "linha_dig"
    t.string "parcela", limit: 20
  end

  create_table "cao_bonus", primary_key: ["bon_categoria", "bon_inicio", "bon_fim"], options: "ENGINE=MyISAM DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.integer "bon_categoria", default: 0, null: false
    t.integer "bon_inicio", default: 0, null: false
    t.integer "bon_fim", default: 0, null: false
    t.float "bon_valor_sem"
    t.float "bon_valor_fimsem"
  end

  create_table "cao_bonus_status", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "co_usuario", limit: 128, default: "", null: false, collation: "utf8_general_ci"
    t.date "data_solic", null: false
    t.string "mes", limit: 128, default: "", null: false
    t.string "valor", limit: 128, default: "", null: false
    t.string "is_solic", limit: 10
    t.string "is_pg", limit: 10
    t.string "is_horas", limit: 10
  end

  create_table "cao_categorias_ombudsman", primary_key: "idcategoria", id: :integer, limit: 1, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "descricao", limit: 100, default: "", null: false
  end

  create_table "cao_cidade", primary_key: "co_cidade", id: :bigint, unsigned: true, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "no_cidade", limit: 30, default: "", null: false
    t.bigint "co_uf", default: 0, null: false
  end

  create_table "cao_cliente", primary_key: "co_cliente", id: :integer, unsigned: true, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "no_razao", limit: 50
    t.string "no_fantasia", limit: 50
    t.string "no_contato", limit: 30
    t.string "nu_telefone", limit: 15
    t.string "nu_ramal", limit: 6
    t.string "nu_cnpj", limit: 18
    t.string "ds_endereco", limit: 150
    t.integer "nu_numero"
    t.string "ds_complemento", limit: 150
    t.string "no_bairro", limit: 50, default: "", null: false
    t.string "nu_cep", limit: 10
    t.string "no_pais", limit: 50
    t.bigint "co_ramo"
    t.bigint "co_cidade", default: 0, null: false
    t.integer "co_status", unsigned: true
    t.string "ds_site", limit: 50
    t.string "ds_email", limit: 50
    t.string "ds_cargo_contato", limit: 50
    t.string "tp_cliente", limit: 2
    t.string "ds_referencia", limit: 100
    t.integer "co_complemento_status", unsigned: true
    t.string "nu_fax", limit: 15
    t.string "ddd2", limit: 10
    t.string "telefone2", limit: 20
  end

  create_table "cao_cliente_contato", primary_key: "co_cliente", id: :integer, default: 0, unsigned: true, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.date "dt_contato"
    t.integer "fg_agendado", default: 0, unsigned: true
    t.time "hr_ini", default: "2000-01-01 00:00:00"
    t.time "hr_end", default: "2000-01-01 00:00:00"
  end

  create_table "cao_comissao", primary_key: "co_comissao", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.integer "co_fatura", default: 0, null: false
    t.date "dt_efetuado", null: false
    t.index ["co_fatura"], name: "co_fatura", unique: true
  end

  create_table "cao_complemento", primary_key: "co_complemento", id: :bigint, unsigned: true, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1", comment: "Descrição da Visita", force: :cascade do |t|
    t.text "ds_complemento", limit: 4294967295
  end

  create_table "cao_conhecimento_usuario", primary_key: ["co_usuario", "co_conhecimento"], options: "ENGINE=MyISAM DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "co_usuario", limit: 20, default: "", null: false
    t.integer "co_conhecimento", default: 0, null: false, unsigned: true
    t.integer "nv_conhecimento", unsigned: true
    t.boolean "is_certificado", unsigned: true
  end

  create_table "cao_conhecimentos", primary_key: "idconhecimento", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "assunto", limit: 100, default: "", null: false
    t.text "conhecimento", null: false
    t.text "url", limit: 255, null: false
    t.text "tags", null: false
    t.string "usuario", limit: 20, default: "", null: false
    t.datetime "datahora", null: false
    t.index ["usuario"], name: "usuario"
  end

  create_table "cao_conhecimentos_fontes", primary_key: "idfonte", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.integer "idconhecimento", default: 0, null: false
    t.datetime "datahora", null: false
    t.string "arquivo", limit: 50, default: "", null: false
    t.string "caminho", limit: 50, default: "", null: false
    t.index ["idconhecimento"], name: "idconhecimento"
  end

  create_table "cao_custo", primary_key: "co_custo", id: :bigint, unsigned: true, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.integer "co_tipo_custo", limit: 1, default: 0, null: false
    t.string "descricao", limit: 100, default: "0", null: false
    t.integer "co_escritorio", limit: 1, default: 0, null: false
    t.date "dt_compra"
    t.date "dt_pagamento"
    t.text "co_boleto"
    t.float "valor", default: 0.0, null: false
    t.string "parcela", limit: 5
    t.boolean "pag"
    t.bigint "co_custo_high", default: 0, null: false, unsigned: true
  end

  create_table "cao_diary_report", primary_key: "co_diary_report", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.time "hr_gasta", default: "2000-01-01 00:00:00"
    t.integer "co_atividade", default: 0, null: false
    t.text "ds_assunto", limit: 4294967295, null: false
    t.bigint "co_movimento", default: 0, null: false
    t.bigint "nu_os", unsigned: true
    t.bigint "co_sistema", unsigned: true
  end

  create_table "cao_diary_report_consultor", primary_key: "co_diary_report_consultor", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1", comment: "contem informacoes referentes a agendamento, visita, elabora", force: :cascade do |t|
    t.integer "co_movimento", default: 0, null: false
    t.integer "co_atividade", default: 0, null: false
    t.text "ds_empresa", limit: 16777215, null: false
    t.text "ds_assunto", limit: 16777215, null: false
    t.datetime "dt_agendamento", null: false
    t.datetime "dt_agendamento_fim"
    t.float "vl_fechamento", default: 0.0, null: false, unsigned: true
    t.bigint "co_cliente"
  end

  create_table "cao_documentacao_casos_uso", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "nome", limit: 70, default: "", null: false
    t.integer "co_sistema", default: 0, null: false
  end

  create_table "cao_documentacao_outros", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "nome", limit: 70, default: "", null: false
    t.integer "co_sistema", default: 0, null: false
  end

  create_table "cao_documentacao_sistema", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.integer "co_sistema", default: 0, null: false
    t.text "descricao"
    t.string "pasta", limit: 30, default: "", null: false
    t.integer "sub_grupo"
    t.string "co_usuario", limit: 60, default: "", null: false
    t.datetime "dt_doc", null: false
    t.string "arquivo", limit: 100, default: "", null: false
  end

  create_table "cao_dr_ativ_comp", primary_key: "id_ativ_comp", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "co_usuario", limit: 20, default: "", null: false
    t.date "data", null: false
    t.text "assunto", null: false
    t.time "tempo_gasto", default: "2000-01-01 00:00:00", null: false
    t.index ["co_usuario"], name: "co_usuario"
  end

  create_table "cao_escala_ranking", primary_key: "idescala", id: :integer, limit: 1, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.integer "qtd_visual", limit: 1, default: 0, null: false
    t.integer "pontuacao", default: 0, null: false
  end

  create_table "cao_escritorio", primary_key: "co_escritorio", id: :integer, limit: 1, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "local", limit: 2, default: "", null: false
  end

  create_table "cao_fatura", primary_key: "co_fatura", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.integer "co_cliente", default: 0, null: false
    t.integer "co_sistema", default: 0, null: false
    t.integer "co_os", default: 0, null: false
    t.integer "num_nf", default: 0, null: false
    t.float "total", default: 0.0, null: false
    t.float "valor", default: 0.0, null: false
    t.date "data_emissao", null: false
    t.text "corpo_nf", null: false
    t.float "comissao_cn", default: 0.0, null: false
    t.float "total_imp_inc", default: 0.0, null: false
  end

  create_table "cao_fatura_pag", primary_key: "id_fatura_pag", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.integer "co_fatura", default: 0, null: false
    t.date "dt_efetuado", null: false
    t.float "valor_pago", default: 0.0, null: false
    t.index ["co_fatura"], name: "co_fatura", unique: true
  end

  create_table "cao_feriados", id: false, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.integer "dia", limit: 1, default: 0, unsigned: true
    t.integer "mes", limit: 1, default: 0, unsigned: true
    t.integer "ano", default: 0
  end

  create_table "cao_formacao_idioma_usuario", primary_key: ["co_usuario", "co_idioma"], options: "ENGINE=MyISAM DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "co_usuario", limit: 20, default: "", null: false
    t.integer "co_idioma", default: 0, null: false
    t.integer "nv_leitura"
    t.integer "nv_escrita"
    t.integer "nv_fala"
  end

  create_table "cao_formacao_usuario", primary_key: ["co_usuario", "tp_curso"], options: "ENGINE=MyISAM DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "co_usuario", limit: 20, default: "", null: false
    t.string "tp_curso", limit: 13, default: "", null: false
    t.string "ds_curso", limit: 50
    t.string "ds_instituicao", limit: 50
    t.date "dt_conclusao"
  end

  create_table "cao_help_autor", primary_key: "co_autor", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "no_autor", limit: 80, default: "0", null: false
    t.integer "co_filial", default: 0, null: false
    t.string "nu_ddd1", limit: 4
    t.string "nu_tel1", limit: 15
    t.string "nu_ramal1", limit: 6
    t.string "nu_ddd2", limit: 4
    t.string "nu_tel2", limit: 15
    t.string "nu_ramal2", limit: 6
    t.string "ds_email", limit: 50
    t.string "ds_funcao", limit: 100, default: "", null: false
    t.index ["co_autor"], name: "co_autor"
  end

  create_table "cao_help_chamado", primary_key: "co_chamado", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.text "ds_chamado", null: false
    t.text "ds_solucao"
    t.integer "co_status", limit: 1, default: 0, null: false
    t.integer "co_motivo", default: 0, null: false
    t.integer "co_tela", default: 0, null: false
    t.integer "co_autor", default: 0, null: false
    t.integer "co_filial", default: 0, null: false
    t.bigint "co_sistema", default: 0, null: false
    t.date "dt_chamado", null: false
    t.date "dt_solucao"
    t.index ["co_chamado"], name: "co_chamado"
  end

  create_table "cao_help_filial", primary_key: "co_filial", id: :integer, unsigned: true, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "no_filial", limit: 70, default: "", null: false
    t.integer "co_cliente", default: 0, null: false
    t.string "estado", limit: 2, default: "", null: false
    t.index ["co_filial"], name: "filialId"
  end

  create_table "cao_help_motivo_chamado", primary_key: "co_motivo", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "ds_motivo", limit: 70, default: "0", null: false
    t.index ["co_motivo"], name: "co_motivo", unique: true
    t.index ["co_motivo"], name: "co_motivo_2"
  end

  create_table "cao_help_status_chamado", primary_key: "co_status", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "ds_status", limit: 50, default: "0", null: false
    t.index ["co_status"], name: "co_status", unique: true
    t.index ["co_status"], name: "co_status_2"
  end

  create_table "cao_help_tela_chamado", primary_key: "co_tela", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.integer "co_cliente", default: 0, null: false
    t.integer "co_sistema", default: 0, null: false
    t.string "ds_tela", limit: 200, default: "", null: false
  end

  create_table "cao_hist_ocorrencias_os", primary_key: "idocorrencia", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.integer "co_os"
    t.string "co_usuario", limit: 20
    t.datetime "data"
    t.string "tipo", limit: 7, default: "Interna", null: false
    t.text "descricao", null: false
    t.string "responsavel", limit: 50, default: "", null: false
    t.datetime "data_fechamento"
    t.index ["co_os"], name: "co_os"
    t.index ["co_usuario"], name: "co_usuario"
  end

  create_table "cao_horario_almoco", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "co_usuario", default: "", null: false
    t.string "almoco_saida_hora", limit: 128, default: "0", null: false
    t.string "almoco_volta_hora", limit: 128, default: "0", null: false
  end

  create_table "cao_log_chamado", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.integer "co_chamado", default: 0, null: false
    t.datetime "dt_chamado", null: false
    t.string "co_usuario", limit: 128, default: "", null: false
    t.integer "co_daily", default: 0, null: false
  end

  create_table "cao_menu", primary_key: "co_menu", id: :integer, limit: 1, unsigned: true, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "ds_menu", default: "", null: false
    t.string "ds_pagina", default: "", null: false
    t.string "ds_imagem"
  end

  create_table "cao_menu_contador", primary_key: ["co_usuario", "co_menu"], options: "ENGINE=MyISAM DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "co_usuario", limit: 20, default: "", null: false
    t.integer "co_menu", limit: 1, default: 0, null: false, unsigned: true
    t.integer "nu_pontos", limit: 1, default: 0, null: false
    t.boolean "in_processado", default: false, null: false, unsigned: true
  end

  create_table "cao_movimento", primary_key: "co_movimento", id: :bigint, unsigned: true, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "co_usuario", limit: 50, default: "", null: false
    t.datetime "dt_entrada", null: false
    t.datetime "dt_saida_almoco", null: false
    t.datetime "dt_volta_almoco", null: false
    t.datetime "dt_saida", null: false
    t.boolean "is_encerrado", default: false, null: false, unsigned: true
    t.index ["co_movimento"], name: "co_movimento"
  end

  create_table "cao_movimento_justificativa", primary_key: "co_movimento_justificativa", id: :bigint, unsigned: true, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.bigint "co_movimento", default: 0, null: false, unsigned: true
    t.bigint "nu_os", default: 0, null: false, unsigned: true
    t.text "ds_justificativa", limit: 4294967295, null: false
    t.index ["co_movimento_justificativa"], name: "co_movimento_justificativa"
  end

  create_table "cao_movimento_os", primary_key: "co_movimento_os", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.integer "nu_os", default: 0, null: false
    t.bigint "co_sistema", default: 0, null: false
    t.bigint "co_tipo_movimento"
    t.bigint "nu_valor"
    t.text "ds_valor", limit: 4294967295
    t.string "usuario_obs", limit: 30
    t.datetime "dt_ini"
    t.datetime "dt_fim"
  end

  create_table "cao_noticia", primary_key: "co_noticia", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "assunto", default: "", null: false
    t.text "descricao", null: false
    t.string "foto", default: "", null: false
    t.string "co_usuario", limit: 60, default: "", null: false
    t.datetime "dt_noticia", null: false
  end

  create_table "cao_obs_cliente", primary_key: "co_obs", id: :integer, unsigned: true, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "descricao", limit: 250, default: "", null: false
    t.integer "co_cliente", default: 0, null: false, unsigned: true
    t.string "co_usuario", limit: 30, default: ""
    t.datetime "dt_obs"
  end

  create_table "cao_obs_sistema", primary_key: "co_obs", id: :integer, unsigned: true, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.text "descricao"
    t.bigint "co_sistema"
    t.string "co_usuario", limit: 20
    t.datetime "dt_obs"
  end

  create_table "cao_ombudsman", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.integer "idtipo", limit: 1, default: 0, null: false
    t.integer "idcategoria", limit: 1, default: 0, null: false
    t.datetime "data", null: false
    t.text "comentario", null: false
    t.integer "co_escritorio", limit: 1, default: 0, null: false
    t.index ["co_escritorio"], name: "co_escritorio"
    t.index ["idcategoria"], name: "idcategoria"
    t.index ["idtipo"], name: "idtipo"
  end

  create_table "cao_os", primary_key: "co_os", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.integer "nu_os"
    t.integer "co_sistema", default: 0
    t.string "co_usuario", limit: 50, default: "0"
    t.integer "co_arquitetura", default: 0
    t.string "ds_os", limit: 200, default: "0"
    t.string "ds_caracteristica", limit: 200, default: "0"
    t.string "ds_requisito", limit: 200
    t.date "dt_inicio"
    t.date "dt_fim"
    t.integer "co_status", default: 0
    t.string "diretoria_sol", limit: 50, default: "0"
    t.date "dt_sol"
    t.string "nu_tel_sol", limit: 20, default: "0"
    t.string "ddd_tel_sol", limit: 5
    t.string "nu_tel_sol2", limit: 20
    t.string "ddd_tel_sol2", limit: 5
    t.string "usuario_sol", limit: 50, default: "0"
    t.date "dt_imp"
    t.date "dt_garantia"
    t.integer "co_email"
    t.integer "co_os_prospect_rel"
  end

  create_table "cao_os_analista", primary_key: "co_analista", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.integer "co_os", default: 0
    t.string "co_usuario", limit: 50, default: "0"
  end

  create_table "cao_os_chamado", primary_key: "co_chamado", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.integer "co_sistema", default: 0, null: false
    t.integer "co_os", default: 0, null: false
    t.string "ds_chamado", default: "", null: false
    t.integer "co_tipo", default: 0, null: false
    t.integer "co_prioridade", default: 0, null: false
    t.integer "co_item", default: 0, null: false
    t.text "descricao", null: false
    t.text "ds_solucao", null: false
    t.string "tempo", limit: 30, default: "", null: false
    t.datetime "dt_chamado", null: false
    t.integer "status", default: 0, null: false
    t.string "co_usuario", default: "", null: false
    t.string "co_analista", default: "", null: false
    t.string "email"
  end

  create_table "cao_os_daily_report", primary_key: "co_daily", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.integer "co_os", default: 0
    t.integer "co_fase", default: 0
    t.string "co_usuario", limit: 50
    t.text "ds_assunto", collation: "utf8_general_ci"
    t.time "tempo_gasto"
    t.datetime "data"
    t.integer "co_status_atual"
    t.integer "co_chamado"
    t.integer "co_atividade"
  end

  create_table "cao_os_email", primary_key: "co_email", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.integer "co_os", default: 0
    t.string "email", limit: 200, default: "0"
    t.string "senha", limit: 20, default: "0"
    t.string "nome", default: "", null: false
    t.integer "co_cliente", default: 0, null: false
    t.integer "ativo", default: 0, null: false
    t.string "ddd", limit: 20
    t.string "tel", limit: 40
    t.string "cargo", limit: 80
  end

  create_table "cao_os_fase", primary_key: "co_fase", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "descricao", limit: 200, default: "0"
    t.string "descricao_ingl", limit: 200, default: "", null: false
    t.integer "ordem"
  end

  create_table "cao_os_item_menu", primary_key: "co_item", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "ds_item", default: "", null: false
    t.integer "co_sistema", default: 0, null: false
  end

  create_table "cao_os_obs", primary_key: "co_obs", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.integer "co_os", default: 0
    t.string "co_usuario", limit: 80, default: "0"
    t.text "descricao"
    t.datetime "dt_obs"
  end

  create_table "cao_os_obs_chamado", primary_key: "co_obs", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.integer "co_chamado", default: 0
    t.string "co_usuario", limit: 80, default: "0"
    t.text "descricao"
    t.datetime "dt_obs"
    t.string "email"
    t.string "arquivo_obs"
  end

  create_table "cao_os_prazo", primary_key: "co_prazo", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.integer "co_os", default: 0
    t.integer "co_fase", default: 0, unsigned: true
    t.integer "total_analista", default: 0
    t.integer "total_hora", default: 0
  end

  create_table "cao_os_status", primary_key: "co_status_atual", id: :integer, unsigned: true, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "ds_status", limit: 50, default: "", null: false
  end

  create_table "cao_pagamento", primary_key: "co_pagamento", id: :bigint, unsigned: true, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "co_usuario", limit: 20, default: "", null: false
    t.string "tp_pagamento", limit: 2, default: "0", null: false
    t.date "dt_pagamento", null: false
    t.float "vl_pagamento", default: 0.0, null: false
    t.date "dt_referencia_pagamento", null: false
    t.index ["co_pagamento"], name: "nu_os"
  end

  create_table "cao_participacao_funcionario", primary_key: "co_part_funcionario", id: :integer, unsigned: true, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.float "pc_participacao", default: 0.0, null: false, unsigned: true
    t.string "co_usuario", limit: 20, default: "", null: false
    t.integer "co_escritorio", limit: 1, default: 0, null: false, unsigned: true
    t.date "dt_referencia", null: false
  end

  create_table "cao_permissao", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "co_usuario", limit: 20, default: "", null: false
    t.string "permissao_intervalo", limit: 1, default: "0", null: false
    t.string "permissao_hora_extra", limit: 1, default: "0", null: false
    t.index ["co_usuario"], name: "co_usuario"
  end

  create_table "cao_permissao_hora_extra", primary_key: "id_permissao", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.bigint "co_movimento", default: 0, null: false
  end

  create_table "cao_pontos_conhecimento", primary_key: "idpontos", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.integer "pontuacao", limit: 1, default: 0, null: false
    t.string "co_coordenador", limit: 50, default: "", null: false
    t.integer "idconhecimento", default: 0, null: false
    t.index ["co_coordenador"], name: "co_coordenador"
    t.index ["idconhecimento"], name: "idconhecimento"
    t.index ["pontuacao", "co_coordenador", "idconhecimento"], name: "pontuacao"
  end

  create_table "cao_ramo", primary_key: "co_ramo", id: :bigint, unsigned: true, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1", comment: "Ramo de atividade de Clientes", force: :cascade do |t|
    t.string "ds_ramo", limit: 60, default: "", null: false
  end

  create_table "cao_rel_email_os", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.integer "co_email", default: 0, null: false
    t.integer "co_os", default: 0, null: false
  end

  create_table "cao_salario", primary_key: ["co_usuario", "dt_alteracao"], options: "ENGINE=MyISAM DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "co_usuario", limit: 20, default: "", null: false
    t.date "dt_alteracao", null: false
    t.float "brut_salario", default: 0.0, null: false
    t.float "liq_salario", default: 0.0, null: false
  end

  create_table "cao_salario_pag", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.integer "id_pagamento", null: false, auto_increment: true
    t.string "co_usuario", limit: 20, default: "", null: false
    t.date "dt_efetuado", null: false
    t.string "status", limit: 10, default: "Pendente", null: false
    t.text "observacao"
    t.index ["co_usuario", "dt_efetuado"], name: "unico", unique: true
    t.index ["id_pagamento"], name: "id_pagamento"
  end

  create_table "cao_servico", primary_key: "co_servico", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "ds_servico", limit: 50, default: "", null: false
  end

  create_table "cao_sistema", primary_key: "co_sistema", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.integer "co_cliente", default: 0, unsigned: true
    t.string "co_usuario", limit: 50, default: "0"
    t.integer "co_arquitetura", default: 0, unsigned: true
    t.string "no_sistema", limit: 200
    t.text "ds_sistema_resumo"
    t.text "ds_caracteristica"
    t.text "ds_requisito"
    t.string "no_diretoria_solic", limit: 100
    t.string "ddd_telefone_solic", limit: 5
    t.string "nu_telefone_solic", limit: 20
    t.string "no_usuario_solic", limit: 100
    t.date "dt_solicitacao"
    t.date "dt_entrega"
    t.integer "co_email"
    t.index ["co_sistema"], name: "co_sistema"
  end

  create_table "cao_sistema_obs", primary_key: "co_obs", id: :integer, unsigned: true, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.text "descricao"
    t.bigint "co_sistema"
    t.string "co_usuario", limit: 20
    t.datetime "dt_obs"
  end

  create_table "cao_status_agendamento", primary_key: "co_status_agendamento", id: :bigint, unsigned: true, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "ds_status_agendamento", limit: 20, default: "", null: false
  end

  create_table "cao_status_cliente", primary_key: "co_status", id: :integer, unsigned: true, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "ds_status", limit: 100, default: "", null: false
  end

  create_table "cao_status_cliente_complemento", primary_key: "co_complemento_status", id: :integer, unsigned: true, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "ds_status", limit: 50, default: ""
    t.integer "co_status", unsigned: true
  end

  create_table "cao_status_os", primary_key: "co_status_atual", id: :integer, unsigned: true, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "ds_status", limit: 50, default: "", null: false
  end

  create_table "cao_temp_import", primary_key: "codigo", id: :bigint, unsigned: true, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "descricao", limit: 60, default: "", null: false
  end

  create_table "cao_tipo_conhecimento_usuario", primary_key: "co_conhecimento", id: :integer, unsigned: true, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "ds_conhecimento", limit: 20
    t.integer "co_sistema", default: 0, null: false, unsigned: true
    t.index ["co_conhecimento"], name: "co_conhecimento"
  end

  create_table "cao_tipo_custo", primary_key: "co_tipo_custo", id: :integer, limit: 1, unsigned: true, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "descricao", limit: 30, default: "", null: false
  end

  create_table "cao_tipo_idioma_usuario", primary_key: "co_idioma", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "ds_idioma", limit: 13
  end

  create_table "cao_tipo_ombudsman", primary_key: "idtipo", id: :integer, limit: 1, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "descricao", limit: 100, default: "", null: false
  end

  create_table "cao_tipo_sistema_usuario", primary_key: "co_sistema", id: :integer, unsigned: true, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "ds_sistema", limit: 40
    t.index ["co_sistema"], name: "co_sistema"
  end

  create_table "cao_uf", primary_key: "co_uf", id: :bigint, unsigned: true, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "ds_uf", limit: 5, default: "", null: false
  end

  create_table "cao_usuario", primary_key: "co_usuario", id: :string, limit: 20, default: "", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "no_usuario", limit: 50, default: "", null: false, collation: "utf8_general_ci"
    t.string "ds_senha", limit: 14, default: "", null: false, collation: "utf8_general_ci"
    t.string "co_usuario_autorizacao", limit: 20, collation: "utf8_general_ci"
    t.bigint "nu_matricula", unsigned: true
    t.date "dt_nascimento"
    t.date "dt_admissao_empresa"
    t.date "dt_desligamento"
    t.datetime "dt_inclusao"
    t.date "dt_expiracao"
    t.string "nu_cpf", limit: 14, collation: "utf8_general_ci"
    t.string "nu_rg", limit: 20, collation: "utf8_general_ci"
    t.string "no_orgao_emissor", limit: 10, collation: "utf8_general_ci"
    t.string "uf_orgao_emissor", limit: 2, collation: "utf8_general_ci"
    t.string "ds_endereco", limit: 150, collation: "utf8_general_ci"
    t.string "no_email", limit: 100, collation: "utf8_general_ci"
    t.string "no_email_pessoal", limit: 100, collation: "utf8_general_ci"
    t.string "nu_telefone", limit: 64, collation: "utf8_general_ci"
    t.datetime "dt_alteracao", null: false
    t.string "url_foto", collation: "utf8_general_ci"
    t.string "instant_messenger", limit: 80, collation: "utf8_general_ci"
    t.integer "icq", unsigned: true
    t.string "msn", limit: 50, collation: "utf8_general_ci"
    t.string "yms", limit: 50, collation: "utf8_general_ci"
    t.string "ds_comp_end", limit: 50, collation: "utf8_general_ci"
    t.string "ds_bairro", limit: 30, collation: "utf8_general_ci"
    t.string "nu_cep", limit: 10, collation: "utf8_general_ci"
    t.string "no_cidade", limit: 50, collation: "utf8_general_ci"
    t.string "uf_cidade", limit: 2, collation: "utf8_general_ci"
    t.date "dt_expedicao"
    t.index ["co_usuario", "no_usuario", "dt_alteracao"], name: "co_usuario_2"
    t.index ["co_usuario"], name: "co_usuario", unique: true
  end

  create_table "cao_usuario_dt_disp", primary_key: "co_dt_disp", id: :integer, unsigned: true, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "co_usuario", limit: 20
    t.date "dt_disp", null: false
    t.date "dt_alt", null: false
  end

  create_table "cao_valor_descanso", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "co_usuario", limit: 40, default: "", null: false, collation: "utf8_general_ci"
    t.string "segundos", limit: 50, default: "", null: false
    t.string "mes_referencia", limit: 50, default: "", null: false
  end

  create_table "permissao_sistema", primary_key: ["co_usuario", "co_tipo_usuario", "co_sistema"], options: "ENGINE=MyISAM DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "co_usuario", limit: 20, default: "", null: false
    t.bigint "co_tipo_usuario", default: 0, null: false, unsigned: true
    t.bigint "co_sistema", default: 0, null: false, unsigned: true
    t.string "in_ativo", limit: 1, default: "S", null: false
    t.string "co_usuario_atualizacao", limit: 20, collation: "utf8_general_ci"
    t.datetime "dt_atualizacao", null: false
    t.index ["co_usuario", "co_tipo_usuario", "co_sistema", "dt_atualizacao"], name: "co_usuario"
  end

  create_table "tipo_usuario", primary_key: ["co_tipo_usuario", "co_sistema"], options: "ENGINE=MyISAM DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.bigint "co_tipo_usuario", default: 0, null: false, unsigned: true
    t.string "ds_tipo_usuario", limit: 32, default: "", null: false, collation: "utf8_general_ci"
    t.bigint "co_sistema", default: 0, null: false, unsigned: true
    t.index ["co_tipo_usuario", "co_sistema"], name: "co_tipo_usuario"
  end

  add_foreign_key "cao_conhecimentos", "cao_usuario", column: "usuario", primary_key: "co_usuario", name: "cao_conhecimentos_ibfk_1", on_update: :cascade
  add_foreign_key "cao_conhecimentos_fontes", "cao_conhecimentos", column: "idconhecimento", primary_key: "idconhecimento", name: "cao_conhecimentos_fontes_ibfk_1", on_update: :cascade
  add_foreign_key "cao_hist_ocorrencias_os", "cao_os", column: "co_os", primary_key: "co_os", name: "cao_hist_ocorrencias_os_ibfk_2", on_update: :cascade, on_delete: :nullify
  add_foreign_key "cao_hist_ocorrencias_os", "cao_usuario", column: "co_usuario", primary_key: "co_usuario", name: "cao_hist_ocorrencias_os_ibfk_1", on_update: :cascade, on_delete: :nullify
  add_foreign_key "cao_ombudsman", "cao_categorias_ombudsman", column: "idcategoria", primary_key: "idcategoria", name: "cao_ombudsman_ibfk_2", on_update: :cascade
  add_foreign_key "cao_ombudsman", "cao_tipo_ombudsman", column: "idtipo", primary_key: "idtipo", name: "cao_ombudsman_ibfk_1", on_update: :cascade
  add_foreign_key "cao_permissao", "cao_usuario", column: "co_usuario", primary_key: "co_usuario", name: "cao_permissao_ibfk_1", on_update: :cascade
  add_foreign_key "cao_pontos_conhecimento", "cao_conhecimentos", column: "idconhecimento", primary_key: "idconhecimento", name: "cao_pontos_conhecimento_ibfk_3", on_update: :cascade
  add_foreign_key "cao_pontos_conhecimento", "cao_escala_ranking", column: "pontuacao", primary_key: "idescala", name: "cao_pontos_conhecimento_ibfk_1", on_update: :cascade
  add_foreign_key "cao_pontos_conhecimento", "cao_usuario", column: "co_coordenador", primary_key: "co_usuario", name: "cao_pontos_conhecimento_ibfk_2", on_update: :cascade
  add_foreign_key "cao_salario_pag", "cao_usuario", column: "co_usuario", primary_key: "co_usuario", name: "cao_salario_pag_ibfk_1", on_update: :cascade
end
