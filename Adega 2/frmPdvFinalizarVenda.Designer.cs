
namespace Adega_2
{
    partial class frmPdvFinalizarVenda
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(frmPdvFinalizarVenda));
            this.pnlPdvFinalVenda = new System.Windows.Forms.Panel();
            this.btnAddFormaPagamento2 = new System.Windows.Forms.Button();
            this.txtFormaPagamento2 = new System.Windows.Forms.TextBox();
            this.cboFormaPagamento2 = new System.Windows.Forms.ComboBox();
            this.label3 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.dgvFinalizarVenda = new System.Windows.Forms.DataGridView();
            this.nome_produto = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.valor_total = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.forma_pagamento = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.btnVoltar = new System.Windows.Forms.Button();
            this.btnDesconto = new System.Windows.Forms.Button();
            this.lblValorTotalProdutoDinheiro = new System.Windows.Forms.Label();
            this.btnFinalizarVenda = new System.Windows.Forms.Button();
            this.pnlValores = new System.Windows.Forms.Panel();
            this.lblDescontoTotal = new System.Windows.Forms.Label();
            this.lblDescontoInfo = new System.Windows.Forms.Label();
            this.txtDesconto = new System.Windows.Forms.TextBox();
            this.chkDesconto = new System.Windows.Forms.CheckBox();
            this.txtValorRecebido = new System.Windows.Forms.TextBox();
            this.lblTrocoDinheiro = new System.Windows.Forms.Label();
            this.lblTroco = new System.Windows.Forms.Label();
            this.lblDesconto = new System.Windows.Forms.Label();
            this.pnlDivisaoVenda = new System.Windows.Forms.Panel();
            this.lblValorRecebido = new System.Windows.Forms.Label();
            this.lblValorTotalProduto = new System.Windows.Forms.Label();
            this.btnAdicionarFormaPagamento = new System.Windows.Forms.Button();
            this.lblFinalizarVenda = new System.Windows.Forms.Label();
            this.pnlPdvFinalVenda.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgvFinalizarVenda)).BeginInit();
            this.pnlValores.SuspendLayout();
            this.SuspendLayout();
            // 
            // pnlPdvFinalVenda
            // 
            this.pnlPdvFinalVenda.Controls.Add(this.btnAddFormaPagamento2);
            this.pnlPdvFinalVenda.Controls.Add(this.txtFormaPagamento2);
            this.pnlPdvFinalVenda.Controls.Add(this.cboFormaPagamento2);
            this.pnlPdvFinalVenda.Controls.Add(this.label3);
            this.pnlPdvFinalVenda.Controls.Add(this.label2);
            this.pnlPdvFinalVenda.Controls.Add(this.label1);
            this.pnlPdvFinalVenda.Controls.Add(this.dgvFinalizarVenda);
            this.pnlPdvFinalVenda.Controls.Add(this.btnVoltar);
            this.pnlPdvFinalVenda.Controls.Add(this.btnDesconto);
            this.pnlPdvFinalVenda.Controls.Add(this.lblValorTotalProdutoDinheiro);
            this.pnlPdvFinalVenda.Controls.Add(this.btnFinalizarVenda);
            this.pnlPdvFinalVenda.Controls.Add(this.pnlValores);
            this.pnlPdvFinalVenda.Controls.Add(this.lblValorTotalProduto);
            this.pnlPdvFinalVenda.Controls.Add(this.btnAdicionarFormaPagamento);
            this.pnlPdvFinalVenda.Controls.Add(this.lblFinalizarVenda);
            this.pnlPdvFinalVenda.Location = new System.Drawing.Point(19, 12);
            this.pnlPdvFinalVenda.Name = "pnlPdvFinalVenda";
            this.pnlPdvFinalVenda.Size = new System.Drawing.Size(988, 574);
            this.pnlPdvFinalVenda.TabIndex = 1;
            // 
            // btnAddFormaPagamento2
            // 
            this.btnAddFormaPagamento2.FlatAppearance.BorderColor = System.Drawing.Color.White;
            this.btnAddFormaPagamento2.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnAddFormaPagamento2.ForeColor = System.Drawing.Color.White;
            this.btnAddFormaPagamento2.Location = new System.Drawing.Point(572, 113);
            this.btnAddFormaPagamento2.Name = "btnAddFormaPagamento2";
            this.btnAddFormaPagamento2.Size = new System.Drawing.Size(75, 23);
            this.btnAddFormaPagamento2.TabIndex = 34;
            this.btnAddFormaPagamento2.Text = "Adicionar";
            this.btnAddFormaPagamento2.UseVisualStyleBackColor = true;
            this.btnAddFormaPagamento2.Visible = false;
            this.btnAddFormaPagamento2.Click += new System.EventHandler(this.btnAddFormaPagamento2_Click);
            // 
            // txtFormaPagamento2
            // 
            this.txtFormaPagamento2.Location = new System.Drawing.Point(516, 115);
            this.txtFormaPagamento2.Name = "txtFormaPagamento2";
            this.txtFormaPagamento2.Size = new System.Drawing.Size(44, 20);
            this.txtFormaPagamento2.TabIndex = 33;
            this.txtFormaPagamento2.Visible = false;
            this.txtFormaPagamento2.TextChanged += new System.EventHandler(this.txtFormaPagamento2_TextChanged);
            // 
            // cboFormaPagamento2
            // 
            this.cboFormaPagamento2.FormattingEnabled = true;
            this.cboFormaPagamento2.Items.AddRange(new object[] {
            "Dinheiro",
            "Débito",
            "Crédito",
            "Pix"});
            this.cboFormaPagamento2.Location = new System.Drawing.Point(389, 114);
            this.cboFormaPagamento2.Name = "cboFormaPagamento2";
            this.cboFormaPagamento2.Size = new System.Drawing.Size(121, 21);
            this.cboFormaPagamento2.TabIndex = 32;
            this.cboFormaPagamento2.Visible = false;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(82, 228);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(35, 13);
            this.label3.TabIndex = 31;
            this.label3.Text = "label3";
            this.label3.Visible = false;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(82, 257);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(35, 13);
            this.label2.TabIndex = 30;
            this.label2.Text = "label2";
            this.label2.Visible = false;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(82, 199);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(35, 13);
            this.label1.TabIndex = 29;
            this.label1.Text = "label1";
            this.label1.Visible = false;
            // 
            // dgvFinalizarVenda
            // 
            this.dgvFinalizarVenda.AllowUserToAddRows = false;
            this.dgvFinalizarVenda.AllowUserToDeleteRows = false;
            this.dgvFinalizarVenda.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvFinalizarVenda.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.nome_produto,
            this.valor_total,
            this.forma_pagamento});
            this.dgvFinalizarVenda.Location = new System.Drawing.Point(162, 181);
            this.dgvFinalizarVenda.Name = "dgvFinalizarVenda";
            this.dgvFinalizarVenda.ReadOnly = true;
            this.dgvFinalizarVenda.Size = new System.Drawing.Size(732, 162);
            this.dgvFinalizarVenda.TabIndex = 28;
            // 
            // nome_produto
            // 
            this.nome_produto.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.Fill;
            this.nome_produto.HeaderText = "Nome";
            this.nome_produto.Name = "nome_produto";
            this.nome_produto.ReadOnly = true;
            // 
            // valor_total
            // 
            this.valor_total.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.Fill;
            this.valor_total.HeaderText = "Valor Total";
            this.valor_total.Name = "valor_total";
            this.valor_total.ReadOnly = true;
            // 
            // forma_pagamento
            // 
            this.forma_pagamento.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.Fill;
            this.forma_pagamento.HeaderText = "Forma Pagamento";
            this.forma_pagamento.Name = "forma_pagamento";
            this.forma_pagamento.ReadOnly = true;
            // 
            // btnVoltar
            // 
            this.btnVoltar.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(18)))), ((int)(((byte)(22)))), ((int)(((byte)(26)))));
            this.btnVoltar.FlatAppearance.BorderColor = System.Drawing.Color.White;
            this.btnVoltar.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnVoltar.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F);
            this.btnVoltar.ForeColor = System.Drawing.Color.White;
            this.btnVoltar.Image = ((System.Drawing.Image)(resources.GetObject("btnVoltar.Image")));
            this.btnVoltar.Location = new System.Drawing.Point(162, 498);
            this.btnVoltar.Name = "btnVoltar";
            this.btnVoltar.Size = new System.Drawing.Size(62, 43);
            this.btnVoltar.TabIndex = 27;
            this.btnVoltar.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageBeforeText;
            this.btnVoltar.UseVisualStyleBackColor = false;
            // 
            // btnDesconto
            // 
            this.btnDesconto.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(18)))), ((int)(((byte)(22)))), ((int)(((byte)(26)))));
            this.btnDesconto.FlatAppearance.BorderColor = System.Drawing.Color.White;
            this.btnDesconto.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnDesconto.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F);
            this.btnDesconto.ForeColor = System.Drawing.Color.White;
            this.btnDesconto.Image = ((System.Drawing.Image)(resources.GetObject("btnDesconto.Image")));
            this.btnDesconto.Location = new System.Drawing.Point(563, 498);
            this.btnDesconto.Name = "btnDesconto";
            this.btnDesconto.Size = new System.Drawing.Size(139, 43);
            this.btnDesconto.TabIndex = 23;
            this.btnDesconto.Text = "Desconto";
            this.btnDesconto.TextImageRelation = System.Windows.Forms.TextImageRelation.TextBeforeImage;
            this.btnDesconto.UseVisualStyleBackColor = false;
            this.btnDesconto.Click += new System.EventHandler(this.btnDesconto_Click);
            // 
            // lblValorTotalProdutoDinheiro
            // 
            this.lblValorTotalProdutoDinheiro.AutoSize = true;
            this.lblValorTotalProdutoDinheiro.Font = new System.Drawing.Font("Microsoft Sans Serif", 15F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblValorTotalProdutoDinheiro.ForeColor = System.Drawing.Color.White;
            this.lblValorTotalProdutoDinheiro.Location = new System.Drawing.Point(848, 114);
            this.lblValorTotalProdutoDinheiro.Name = "lblValorTotalProdutoDinheiro";
            this.lblValorTotalProdutoDinheiro.Size = new System.Drawing.Size(50, 25);
            this.lblValorTotalProdutoDinheiro.TabIndex = 26;
            this.lblValorTotalProdutoDinheiro.Text = "0,00";
            this.lblValorTotalProdutoDinheiro.Click += new System.EventHandler(this.lblValorTotalProdutoDinheiro_Click);
            // 
            // btnFinalizarVenda
            // 
            this.btnFinalizarVenda.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(18)))), ((int)(((byte)(22)))), ((int)(((byte)(26)))));
            this.btnFinalizarVenda.FlatAppearance.BorderColor = System.Drawing.Color.White;
            this.btnFinalizarVenda.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnFinalizarVenda.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F);
            this.btnFinalizarVenda.ForeColor = System.Drawing.Color.White;
            this.btnFinalizarVenda.Image = ((System.Drawing.Image)(resources.GetObject("btnFinalizarVenda.Image")));
            this.btnFinalizarVenda.Location = new System.Drawing.Point(756, 498);
            this.btnFinalizarVenda.Name = "btnFinalizarVenda";
            this.btnFinalizarVenda.Size = new System.Drawing.Size(139, 43);
            this.btnFinalizarVenda.TabIndex = 21;
            this.btnFinalizarVenda.Text = "Finalizar venda";
            this.btnFinalizarVenda.TextImageRelation = System.Windows.Forms.TextImageRelation.TextBeforeImage;
            this.btnFinalizarVenda.UseVisualStyleBackColor = false;
            this.btnFinalizarVenda.Click += new System.EventHandler(this.btnFinalizarVenda_Click);
            // 
            // pnlValores
            // 
            this.pnlValores.Controls.Add(this.lblDescontoTotal);
            this.pnlValores.Controls.Add(this.lblDescontoInfo);
            this.pnlValores.Controls.Add(this.txtDesconto);
            this.pnlValores.Controls.Add(this.chkDesconto);
            this.pnlValores.Controls.Add(this.txtValorRecebido);
            this.pnlValores.Controls.Add(this.lblTrocoDinheiro);
            this.pnlValores.Controls.Add(this.lblTroco);
            this.pnlValores.Controls.Add(this.lblDesconto);
            this.pnlValores.Controls.Add(this.pnlDivisaoVenda);
            this.pnlValores.Controls.Add(this.lblValorRecebido);
            this.pnlValores.Location = new System.Drawing.Point(162, 364);
            this.pnlValores.Name = "pnlValores";
            this.pnlValores.Size = new System.Drawing.Size(732, 114);
            this.pnlValores.TabIndex = 24;
            // 
            // lblDescontoTotal
            // 
            this.lblDescontoTotal.AutoSize = true;
            this.lblDescontoTotal.Font = new System.Drawing.Font("Microsoft Sans Serif", 15F);
            this.lblDescontoTotal.ForeColor = System.Drawing.Color.White;
            this.lblDescontoTotal.Location = new System.Drawing.Point(429, 66);
            this.lblDescontoTotal.Name = "lblDescontoTotal";
            this.lblDescontoTotal.Size = new System.Drawing.Size(50, 25);
            this.lblDescontoTotal.TabIndex = 12;
            this.lblDescontoTotal.Text = "0,00";
            // 
            // lblDescontoInfo
            // 
            this.lblDescontoInfo.AutoSize = true;
            this.lblDescontoInfo.Font = new System.Drawing.Font("Microsoft Sans Serif", 15F);
            this.lblDescontoInfo.ForeColor = System.Drawing.Color.White;
            this.lblDescontoInfo.Location = new System.Drawing.Point(222, 68);
            this.lblDescontoInfo.Name = "lblDescontoInfo";
            this.lblDescontoInfo.Size = new System.Drawing.Size(212, 25);
            this.lblDescontoInfo.TabIndex = 11;
            this.lblDescontoInfo.Text = "Total com desconto R$";
            // 
            // txtDesconto
            // 
            this.txtDesconto.Location = new System.Drawing.Point(152, 72);
            this.txtDesconto.Name = "txtDesconto";
            this.txtDesconto.Size = new System.Drawing.Size(47, 20);
            this.txtDesconto.TabIndex = 10;
            this.txtDesconto.Visible = false;
            // 
            // chkDesconto
            // 
            this.chkDesconto.AutoSize = true;
            this.chkDesconto.Location = new System.Drawing.Point(130, 75);
            this.chkDesconto.Name = "chkDesconto";
            this.chkDesconto.Size = new System.Drawing.Size(15, 14);
            this.chkDesconto.TabIndex = 9;
            this.chkDesconto.UseVisualStyleBackColor = true;
            this.chkDesconto.CheckedChanged += new System.EventHandler(this.chkDesconto_CheckedChanged);
            // 
            // txtValorRecebido
            // 
            this.txtValorRecebido.Location = new System.Drawing.Point(646, 15);
            this.txtValorRecebido.Name = "txtValorRecebido";
            this.txtValorRecebido.Size = new System.Drawing.Size(61, 20);
            this.txtValorRecebido.TabIndex = 8;
            this.txtValorRecebido.TextChanged += new System.EventHandler(this.txtValorRecebido_TextChanged);
            // 
            // lblTrocoDinheiro
            // 
            this.lblTrocoDinheiro.AutoSize = true;
            this.lblTrocoDinheiro.Font = new System.Drawing.Font("Microsoft Sans Serif", 15F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblTrocoDinheiro.ForeColor = System.Drawing.Color.White;
            this.lblTrocoDinheiro.Location = new System.Drawing.Point(657, 68);
            this.lblTrocoDinheiro.Name = "lblTrocoDinheiro";
            this.lblTrocoDinheiro.Size = new System.Drawing.Size(50, 25);
            this.lblTrocoDinheiro.TabIndex = 7;
            this.lblTrocoDinheiro.Text = "0,00";
            // 
            // lblTroco
            // 
            this.lblTroco.AutoSize = true;
            this.lblTroco.Font = new System.Drawing.Font("Microsoft Sans Serif", 15F);
            this.lblTroco.ForeColor = System.Drawing.Color.White;
            this.lblTroco.Location = new System.Drawing.Point(564, 67);
            this.lblTroco.Name = "lblTroco";
            this.lblTroco.Size = new System.Drawing.Size(98, 25);
            this.lblTroco.TabIndex = 6;
            this.lblTroco.Text = "Troco: R$";
            // 
            // lblDesconto
            // 
            this.lblDesconto.AutoSize = true;
            this.lblDesconto.Font = new System.Drawing.Font("Microsoft Sans Serif", 15F);
            this.lblDesconto.ForeColor = System.Drawing.Color.White;
            this.lblDesconto.Location = new System.Drawing.Point(11, 68);
            this.lblDesconto.Name = "lblDesconto";
            this.lblDesconto.Size = new System.Drawing.Size(118, 25);
            this.lblDesconto.TabIndex = 4;
            this.lblDesconto.Text = "Desconto %";
            // 
            // pnlDivisaoVenda
            // 
            this.pnlDivisaoVenda.BackColor = System.Drawing.Color.White;
            this.pnlDivisaoVenda.Location = new System.Drawing.Point(9, 49);
            this.pnlDivisaoVenda.Name = "pnlDivisaoVenda";
            this.pnlDivisaoVenda.Size = new System.Drawing.Size(709, 2);
            this.pnlDivisaoVenda.TabIndex = 3;
            // 
            // lblValorRecebido
            // 
            this.lblValorRecebido.AutoSize = true;
            this.lblValorRecebido.Font = new System.Drawing.Font("Microsoft Sans Serif", 15F);
            this.lblValorRecebido.ForeColor = System.Drawing.Color.White;
            this.lblValorRecebido.Location = new System.Drawing.Point(467, 10);
            this.lblValorRecebido.Name = "lblValorRecebido";
            this.lblValorRecebido.Size = new System.Drawing.Size(173, 25);
            this.lblValorRecebido.TabIndex = 0;
            this.lblValorRecebido.Text = "Valor recebido: R$";
            // 
            // lblValorTotalProduto
            // 
            this.lblValorTotalProduto.AutoSize = true;
            this.lblValorTotalProduto.Font = new System.Drawing.Font("Microsoft Sans Serif", 15F);
            this.lblValorTotalProduto.ForeColor = System.Drawing.Color.White;
            this.lblValorTotalProduto.Location = new System.Drawing.Point(653, 114);
            this.lblValorTotalProduto.Name = "lblValorTotalProduto";
            this.lblValorTotalProduto.Size = new System.Drawing.Size(189, 25);
            this.lblValorTotalProduto.TabIndex = 25;
            this.lblValorTotalProduto.Text = "Total do produto: R$";
            // 
            // btnAdicionarFormaPagamento
            // 
            this.btnAdicionarFormaPagamento.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(18)))), ((int)(((byte)(22)))), ((int)(((byte)(26)))));
            this.btnAdicionarFormaPagamento.FlatAppearance.BorderColor = System.Drawing.Color.White;
            this.btnAdicionarFormaPagamento.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnAdicionarFormaPagamento.ForeColor = System.Drawing.Color.White;
            this.btnAdicionarFormaPagamento.Image = ((System.Drawing.Image)(resources.GetObject("btnAdicionarFormaPagamento.Image")));
            this.btnAdicionarFormaPagamento.Location = new System.Drawing.Point(162, 98);
            this.btnAdicionarFormaPagamento.Name = "btnAdicionarFormaPagamento";
            this.btnAdicionarFormaPagamento.Size = new System.Drawing.Size(212, 51);
            this.btnAdicionarFormaPagamento.TabIndex = 22;
            this.btnAdicionarFormaPagamento.Text = "Adicionar forma de pagamento";
            this.btnAdicionarFormaPagamento.TextImageRelation = System.Windows.Forms.TextImageRelation.TextBeforeImage;
            this.btnAdicionarFormaPagamento.UseVisualStyleBackColor = false;
            this.btnAdicionarFormaPagamento.Click += new System.EventHandler(this.btnAdicionarFormaPagamento_Click);
            // 
            // lblFinalizarVenda
            // 
            this.lblFinalizarVenda.AutoSize = true;
            this.lblFinalizarVenda.Font = new System.Drawing.Font("Microsoft Sans Serif", 30F);
            this.lblFinalizarVenda.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(182)))), ((int)(((byte)(0)))));
            this.lblFinalizarVenda.Location = new System.Drawing.Point(376, 12);
            this.lblFinalizarVenda.Name = "lblFinalizarVenda";
            this.lblFinalizarVenda.Size = new System.Drawing.Size(288, 46);
            this.lblFinalizarVenda.TabIndex = 20;
            this.lblFinalizarVenda.Text = "Finalizar venda";
            // 
            // frmPdvFinalizarVenda
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(35)))), ((int)(((byte)(44)))), ((int)(((byte)(51)))));
            this.ClientSize = new System.Drawing.Size(1026, 598);
            this.Controls.Add(this.pnlPdvFinalVenda);
            this.Name = "frmPdvFinalizarVenda";
            this.Text = "frmPdvFinalizarVenda";
            this.pnlPdvFinalVenda.ResumeLayout(false);
            this.pnlPdvFinalVenda.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgvFinalizarVenda)).EndInit();
            this.pnlValores.ResumeLayout(false);
            this.pnlValores.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Panel pnlPdvFinalVenda;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.DataGridView dgvFinalizarVenda;
        private System.Windows.Forms.Button btnVoltar;
        private System.Windows.Forms.Button btnDesconto;
        private System.Windows.Forms.Label lblValorTotalProdutoDinheiro;
        private System.Windows.Forms.Button btnFinalizarVenda;
        private System.Windows.Forms.Panel pnlValores;
        private System.Windows.Forms.Label lblDescontoTotal;
        private System.Windows.Forms.Label lblDescontoInfo;
        private System.Windows.Forms.TextBox txtDesconto;
        private System.Windows.Forms.CheckBox chkDesconto;
        private System.Windows.Forms.TextBox txtValorRecebido;
        private System.Windows.Forms.Label lblTrocoDinheiro;
        private System.Windows.Forms.Label lblTroco;
        private System.Windows.Forms.Label lblDesconto;
        private System.Windows.Forms.Panel pnlDivisaoVenda;
        private System.Windows.Forms.Label lblValorRecebido;
        private System.Windows.Forms.Label lblValorTotalProduto;
        private System.Windows.Forms.Button btnAdicionarFormaPagamento;
        private System.Windows.Forms.Label lblFinalizarVenda;
        private System.Windows.Forms.DataGridViewTextBoxColumn nome_produto;
        private System.Windows.Forms.DataGridViewTextBoxColumn valor_total;
        private System.Windows.Forms.DataGridViewTextBoxColumn forma_pagamento;
        private System.Windows.Forms.TextBox txtFormaPagamento2;
        private System.Windows.Forms.ComboBox cboFormaPagamento2;
        private System.Windows.Forms.Button btnAddFormaPagamento2;
    }
}