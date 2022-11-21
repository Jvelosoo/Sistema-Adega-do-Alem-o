-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 21-Nov-2022 às 19:49
-- Versão do servidor: 10.4.25-MariaDB
-- versão do PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `bd_adega`
--

DELIMITER $$
--
-- Procedimentos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `spAlterarPreco` (IN `pCodigoProduto` INT, `pPrecoQuente` VARCHAR(100), `pPrecoGelado` VARCHAR(100), `pPrecoCusto` VARCHAR(100))   BEGIN

	declare CodigoProduto int;
	declare pTipoPrecoQuente int;
	declare pTipoPrecoGelado int;
	declare pTipoPrecoCusto int;

select cod_tipo_preco into @pTipoPrecoQuente from tbtipopreco where descricao = 'Quente';
select cod_tipo_preco into @pTipoPrecoGelado from tbtipopreco where descricao = 'Gelado';
select cod_tipo_preco into @pTipoPrecoCusto from tbtipopreco where descricao = 'Preço de custo';

select cod_produto into @CodigoProduto from tbprodutos where cod_produto = pCodigoProduto order by cod_produto desc LIMIT 1;



update tbpreco set ativo = '0' where cod_produto = @CodigoProduto;

insert into tbpreco (cod_produto, preco, data_preco, cod_tipo_preco, ativo)
	values(pCodigoProduto, pPrecoQuente, now(), @pTipoPrecoQuente, 1);

insert into tbpreco (cod_produto, preco, data_preco, cod_tipo_preco, ativo)
	values(pCodigoProduto, pPrecoGelado, now(), @pTipoPrecoQuente, 1);

insert into tbpreco (cod_produto, preco, data_preco, cod_tipo_preco, ativo)
	values(pCodigoProduto, pPrecoCusto, now(), @pTipoPrecoQuente, 1);




end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spAtualizarFuncionarios` (IN `pid` INT, IN `pnome` VARCHAR(100), IN `psenha` VARCHAR(100), IN `pemail` VARCHAR(100), IN `pcpf` CHAR(14), IN `pstatusFuncionario` VARCHAR(20), IN `pfuncao` CHAR(1), IN `pdataNascimento` DATE, IN `pDataContratacao` DATE, IN `pfone` CHAR(15))   BEGIN
	declare ChaveCriptografada varchar (100);

	
select s.chaves_criptografadas into @ChaveCriptografada from tbsenhas s, tbfuncionarios f where f.id = pid;


	
update tbfuncionarios set nome = pnome, senha = AES_ENCRYPT(psenha, @ChaveCriptografada), email = pemail, cpf = pcpf, status_funcionario = pstatusFuncionario, funcao = pfuncao, data_nascimento = pdataNascimento, data_contratacao = pDataContratacao , fone = pfone WHERE id = pid;



End$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spConsultarCategorias` (IN `pnomecategoria` VARCHAR(100))   BEGIN -- Início
IF (pnomecategoria != '') THEN
-- Instruções TSQL
 SELECT * from tbcategoria where nome_categoria LIKE CONCAT('%',
pnomecategoria , '%');
ELSE
 SELECT * from tbcategoria;
END IF;
 
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spConsultarDescricao` (IN `pnome` VARCHAR(100), `pDescricao` VARCHAR(100))   BEGIN -- Início



if (pDescricao = 'Gelado') then
	select tbprodutos.cod_produto, tbprodutos.nome_produto, tbtipopreco.descricao, tbpreco.preco from tbprodutos, tbpreco, tbtipopreco where tbprodutos.nome_produto = pnome and tbpreco.cod_tipo_preco = '1' and tbprodutos.cod_produto = tbpreco.cod_produto  and tbpreco.cod_tipo_preco = tbtipopreco.cod_tipo_preco;

end if;

if (pDescricao = 'Quente') then
	select tbprodutos.cod_produto, tbprodutos.nome_produto, tbtipopreco.descricao, tbpreco.preco from tbprodutos, tbpreco, tbtipopreco where tbprodutos.nome_produto = pnome and tbpreco.cod_tipo_preco = '2' and tbprodutos.cod_produto = tbpreco.cod_produto  and tbpreco.cod_tipo_preco = tbtipopreco.cod_tipo_preco;

end if;

if (pDescricao = 'Preço de custo') then
	select tbprodutos.cod_produto, tbprodutos.nome_produto, tbtipopreco.descricao, tbpreco.preco from tbprodutos, tbpreco, tbtipopreco where tbprodutos.nome_produto = pnome and tbpreco.cod_tipo_preco = '3' and tbprodutos.cod_produto = tbpreco.cod_produto  and tbpreco.cod_tipo_preco = tbtipopreco.cod_tipo_preco;
end if;






END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spConsultarFuncionarios` (IN `pnome` VARCHAR(100))   BEGIN -- Início

IF (pnome != '' ) THEN
-- Instruções TSQL
 SELECT * from tbfuncionarios where nome LIKE CONCAT('%',
pnome , '%');
ELSE
 SELECT * from tbfuncionarios;
END IF;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spConsultarPedidos` (IN `pnome` VARCHAR(100), `pinicio` VARCHAR(100), `pfinal` VARCHAR(100))   BEGIN -- Início



IF (pnome = '') THEN
-- Instruções TSQL



SELECT pe.cod_pedido, pe.cod_produto, pe.cod_cliente, pe.quantidade, pe.data_pedido, pe.valor_total, pr.nome_produto FROM tbpedidos AS pe
INNER JOIN tbprodutos AS pr
ON pe.cod_produto = pr.cod_produto WHERE pe.data_pedido between pinicio and pfinal;



ELSE
SELECT pe.cod_pedido, pe.cod_produto, pe.cod_cliente, pe.quantidade, pe.data_pedido, pe.valor_total, pr.nome_produto FROM tbpedidos AS pe
INNER JOIN tbprodutos AS pr
ON pe.cod_produto = pr.cod_produto where pr.nome_produto = pnome;



END IF;



END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spConsultarProdutos` (IN `pnome` VARCHAR(100))   BEGIN -- Início

IF (pnome != '' ) THEN
-- Instruções TSQL
 SELECT * from tbprodutos where nome_produto LIKE CONCAT('%',
pnome , '%');
ELSE
 SELECT * from tbprodutos;
END IF;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spConsultarProdutosPdv` (IN `pnome` VARCHAR(100))   BEGIN -- Início

IF (pnome != '') THEN
-- Instruções TSQL
SELECT pd.cod_produto, pd.nome_produto, pc.preco from tbprodutos pd, tbpreco pc where nome_produto = pnome and pd.cod_produto = pc.cod_produto;
ELSE
 SELECT * from tbprodutos;
END IF;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spConsultarProdutosPreco` (IN `pnome` VARCHAR(100))   BEGIN -- Início

	declare CodigoProduto int;

select cod_produto into @CodigoProduto from tbprodutos where nome_produto = pnome;

IF (pnome != '') THEN
-- Instruções TSQL

SELECT 
tbprodutos.cod_produto,
tbprodutos.nome_produto,
tbprodutos.qntd_estoque,
tbpreco.cod_tipo_preco,
tbpreco.preco
FROM tbprodutos, tbpreco where tbprodutos.nome_produto = pnome and tbpreco.cod_produto = @CodigoProduto and tbpreco.ativo = '1';

ELSE

SELECT 
tbprodutos.cod_produto,
tbprodutos.nome_produto,
tbprodutos.qntd_estoque,
tbpreco.preco,
tbtipopreco.descricao
FROM tbprodutos, tbpreco, tbtipopreco where tbprodutos.cod_produto = tbpreco.cod_produto and tbtipopreco.cod_tipo_preco = tbpreco.cod_tipo_preco ;

end if;

end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spFechamentoCaixa` (IN `pFormaPagamentoDinheiro` VARCHAR(100), `pFormaPagamentoDebito` VARCHAR(100), `pFormaPagamentoCredito` VARCHAR(100), `pFormaPagamentoPix` VARCHAR(100))   BEGIN -- Início

DECLARE pagamentodebito decimal(19,2);
DECLARE pagamentodebito2 decimal(19,2);

declare pagamentodinheiro decimal(19,2);
declare pagamentodinheiro2 decimal(19,2);

declare pagamentocredito decimal(19,2);
declare pagamentocredito2 decimal(19,2);

declare pagamentopix decimal(19,2);
declare pagamentopix2 decimal(19,2);







if (pFormaPagamentoDinheiro = '') then
	set @pagamentodinheiro = 0;
else
	select sum(valor_pagamento_1) into @pagamentodinheiro from tbpedidos
	WHERE data_pedido BETWEEN CURDATE() AND DATE_ADD(CURDATE(), INTERVAL 1 DAY) and forma_pagamento = pFormaPagamentoDinheiro;
end if ; 


if (pFormaPagamentoDinheiro = '') then
	set @pagamentodinheiro2 = 0;
else
	select sum(valor_pagamento_2) into @pagamentodinheiro2 from tbpedidos
	WHERE data_pedido BETWEEN CURDATE() AND DATE_ADD(CURDATE(), INTERVAL 1 DAY) and forma_pagamento_2 = pFormaPagamentoDinheiro;
end if ; 




if (pFormaPagamentoDebito = '') then
	set @pagamentodebito = 0;
else
	select sum(valor_pagamento_1) into @pagamentodebito from tbpedidos
	WHERE data_pedido BETWEEN CURDATE() AND DATE_ADD(CURDATE(), INTERVAL 1 DAY) and forma_pagamento = pFormaPagamentoDebito;
end if;

if (pFormaPagamentoDebito = '') then
	set @pagamentodebito2 = 0;
else
	select sum(valor_pagamento_2) into @pagamentodebito2 from tbpedidos
	WHERE data_pedido BETWEEN CURDATE() AND DATE_ADD(CURDATE(), INTERVAL 1 DAY) and forma_pagamento_2 = pFormaPagamentoDebito;
end if;





if (pFormaPagamentoCredito = '') then
	set @pagamentocredito = 0;
else
	select sum(valor_pagamento_1) into @pagamentocredito from tbpedidos
	WHERE data_pedido BETWEEN CURDATE() AND DATE_ADD(CURDATE(), INTERVAL 1 DAY) and forma_pagamento = pFormaPagamentoCredito;
end if;
if (pFormaPagamentoCredito = '') then
	set @pagamentocredito2 = 0;
else
	select sum(valor_pagamento_2) into @pagamentocredito2 from tbpedidos
	WHERE data_pedido BETWEEN CURDATE() AND DATE_ADD(CURDATE(), INTERVAL 1 DAY) and forma_pagamento_2 = pFormaPagamentoCredito;
end if;



if (pFormaPagamentoPix = '') then
	set @pagamentopix = 0;
else
	select sum(valor_pagamento_1) into @pagamentopix from tbpedidos
	WHERE data_pedido BETWEEN CURDATE() AND DATE_ADD(CURDATE(), INTERVAL 1 DAY) and forma_pagamento = pFormaPagamentoPix;
end if;
if (pFormaPagamentoPix = '') then
	set @pagamentopix2 = 0;
else
	select sum(valor_pagamento_2) into @pagamentopix2 from tbpedidos
	WHERE data_pedido BETWEEN CURDATE() AND DATE_ADD(CURDATE(), INTERVAL 1 DAY) and forma_pagamento_2 = pFormaPagamentoPix;
end if;



if @pagamentodinheiro is null then
	set @pagamentodinheiro = 0;
end if;
if @pagamentodinheiro2 is null then
	set @pagamentodinheiro2 = 0;
end if;

if @pagamentodebito is null then
	set @pagamentodebito = 0;
end if;
if @pagamentodebito2 is null then
	set @pagamentodebito2 = 0;
end if;


if @pagamentocredito is null then
	set @pagamentocredito = 0;
end if;
if @pagamentocredito2 is null then
	set @pagamentocredito2 = 0;
end if;

if @pagamentopix is null then
	set @pagamentopix = 0;
end if;
if @pagamentopix2 is null then
	set @pagamentopix2 = 0;
end if;

select @pagamentodinheiro,
@pagamentodebito,
@pagamentocredito,
@pagamentopix,

@pagamentodinheiro2,
@pagamentodebito2,
@pagamentocredito2,
@pagamentopix2;


END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spFechandoCaixa` (`pValorTotal` DECIMAL(19,2), `pValorRetirada` DECIMAL(19,2))   BEGIN -- Início


insert into tbfechamentocaixa (data,valor_total,valor_retirada)
values (now(), pValorTotal, pValorRetirada);


END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spIncluirFuncionarios` (IN `pnome` VARCHAR(100), IN `psenha` VARCHAR(100), IN `pemail` VARCHAR(100), IN `pcpf` CHAR(14), IN `pstatusFuncionario` VARCHAR(20), IN `pfuncao` CHAR(1), IN `pdataNascimento` CHAR(11), IN `pDataContratacao` CHAR(11), IN `pfone` CHAR(15))   BEGIN

declare idAleatorio varchar(100);
declare ChaveCriptografada varchar (100);

	set @idAleatorio = FLOOR(RAND() * 99999);
    
	set @ChaveCriptografada =  concat(substring('ABCDEFGHIJKLMNOPQRSTUVWXYZ ', rand()*28, 1),
                  substring('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ ', rand()*28, 1),
                  substring('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ ', rand()*28, 1),
                  substring('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ ', rand()*28, 1),
                  substring('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ ', rand()*28, 1),
                  substring('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ ', rand()*28, 1),
                  substring('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ ', rand()*28, 1),
                  substring('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ ', rand()*28, 1),
                  substring('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ ', rand()*28, 1));

	
insert into tbfuncionarios (id, nome, senha, email, cpf, status_funcionario, funcao, data_nascimento, data_contratacao , fone)
values (@idAleatorio, pnome, AES_ENCRYPT(psenha, @ChaveCriptografada), pemail, pcpf, pstatusFuncionario, pfuncao, pdataNascimento, pdataContratacao, pfone);


insert into tbsenhas (id, chaves_criptografadas)
                values (@idAleatorio, @ChaveCriptografada);
                
select @idAleatorio;


End$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spIncluirProdutos` (IN `pnome_produto` VARCHAR(100), `punidade` INT, `pqntd_estoque` INT, `pcategoria` VARCHAR(100), `pprecoquente` DECIMAL(19,2), `pprecogelado` DECIMAL(19,2), `pprecocusto` DECIMAL(19,2))   begin

	declare CodigoProduto int;
    	declare CodigoPedido int;
	declare pTipoPrecoQuente int;
	declare pTipoPrecoGelado int;
	declare pTipoPrecoCusto int;





select cod_tipo_preco into @pTipoPrecoQuente from tbtipopreco where descricao = 'Quente';
select cod_tipo_preco into @pTipoPrecoGelado from tbtipopreco where descricao = 'Gelado';
select cod_tipo_preco into @pTipoPrecoCusto from tbtipopreco where descricao = 'Preço de custo';

select cod_produto into @CodigoProduto from tbprodutos order by cod_produto desc LIMIT 1;



if @CodigoProduto is null then
	set @CodigoProduto = 1;
ELSE
	set @CodigoProduto = @CodigoProduto + 1;
end if;

        

insert into tbprodutos (cod_produto, nome_produto, unidade,  status_produtos, qntd_estoque, categoria)
values (@CodigoProduto, pnome_produto, punidade, 'A', pqntd_estoque, pcategoria);


insert into tbpreco (cod_produto, preco, data_preco, cod_tipo_preco, ativo)
	values(@CodigoProduto, pprecoquente, now(), @pTipoPrecoQuente, 1);
    
 
insert into tbpreco (cod_produto, preco, data_preco, cod_tipo_preco, ativo)
	values(@CodigoProduto, pprecogelado, now(), @pTipoPrecoGelado, 1);
    


insert into tbpreco (cod_produto, preco, data_preco, cod_tipo_preco, ativo)
	values(@CodigoProduto,pprecocusto, now(), @pTipoPrecoCusto, 1);
    
     
     



End$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spListarPedidos` (IN `pnome` VARCHAR(100))   BEGIN -- Início
select tbpedidos.valor_total, tbpedidos.forma_pagamento, tbprodutos.nome_produto
from tbprodutos, tbpedidos
where tbpedidos.cod_produto = tbprodutos.cod_produto and tbpedidos.cod_pedido order by data_pedido desc limit 1;
 

 

End$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spLoginFuncionario` (IN `pEmail` VARCHAR(100), `pSenha` VARCHAR(100))   begin

-- Instruções TSQL


-- Verificar quantos usuarios existem

select f.id, f.nome from tbfuncionarios f where f.email = pEmail and f.senha = AES_ENCRYPT(pSenha, (SELECT s.chaves_criptografadas
FROM tbfuncionarios f
INNER JOIN tbsenhas s ON 
f.id=s.id WHERE f.email = pEmail));



end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spPedidoFormaPagamento2` (IN `pFormaPagamento` VARCHAR(100), `pValor` DECIMAL(19,2))   BEGIN

declare UltimoPedido int;
declare Valor1 decimal (19,2);


select cod_pedido into @UltimoPedido from tbpedidos order by cod_pedido desc limit 1;
select valor_pagamento_1 into @Valor1 from tbpedidos where cod_pedido = @UltimoPedido order by valor_pagamento_1 desc limit 1;




update tbpedidos set valor_pagamento_1 = @Valor1 - pValor, forma_pagamento_2 = pFormaPagamento, valor_pagamento_2 = pValor where cod_pedido = @UltimoPedido;

End$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spRealizarPedidos` (IN `pNomeCliente` VARCHAR(100), `pNomeProduto` VARCHAR(100), `pQuantidade` INT, `pDescricao` VARCHAR(100), `pValorTotal` DECIMAL(19,2), `pFormaPagamento` VARCHAR(100))   BEGIN
declare CodigoPedido int;
declare CodigoCliente int;
declare CodigoProduto int;
declare Preco decimal(19,2);
declare CodigoTipoPreco int;
declare ValorTotal decimal (19,2);







set @ValorTotal = pValorTotal;


select cod_produto into @CodigoProduto from tbprodutos where nome_produto = pNomeProduto;
select cod_cliente into @CodigoCliente from tbpedidos order by cod_cliente desc LIMIT 1;
select cod_pedido into @CodigoPedido from tbpedidos  order by cod_pedido desc LIMIT 1;






select tbpreco.preco  into @Preco from tbprodutos, tbpreco, tbtipopreco where tbprodutos.cod_produto = @CodigoProduto and tbpreco.cod_produto = @CodigoProduto and tbtipopreco.descricao = pDescricao and tbtipopreco.cod_tipo_preco = tbpreco.cod_tipo_preco;



if @CodigoPedido is null then
	set @CodigoPedido = 1;
ELSE
	set @CodigoPedido = @CodigoPedido + 1;
end if;

if @CodigoCliente is null then
	set @CodigoCliente = 1;
ELSE
	set @CodigoCliente = @CodigoCliente + 1;
end if;
	
insert into tbpedidos (cod_pedido, cod_produto, cod_cliente, quantidade, data_pedido, preco, descricao, forma_pagamento, forma_pagamento_2, valor_pagamento_1, valor_pagamento_2,  valor_total)
values (@CodigoPedido, @CodigoProduto, @CodigoCliente, pQuantidade, now(), @Preco, pDescricao , pFormaPagamento, '', @ValorTotal, '',  pValorTotal);


insert into tbpagamentos (forma_pagamento, cod_cliente)
values (pFormaPagamento, @CodigoCliente);

insert into tbclientes (cod_cliente, nome_cliente, cod_pedido, forma_pagamento)
values (@CodigoCliente, pNomeCliente, @CodigoPedido, pFormaPagamento);


update tbprodutos set unidade = (select unidade from tbprodutos where cod_produto = @CodigoProduto) - pQuantidade where cod_produto = @CodigoProduto;

End$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbcategoria`
--

CREATE TABLE `tbcategoria` (
  `cod_categoria` int(11) NOT NULL,
  `nome_categoria` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tbcategoria`
--

INSERT INTO `tbcategoria` (`cod_categoria`, `nome_categoria`) VALUES
(1, 'Combo'),
(2, 'Água'),
(3, 'Cachaça'),
(4, 'Cerveja'),
(5, 'Energético'),
(6, 'Licor'),
(7, 'Vinho'),
(8, 'Destilado'),
(9, 'Espumante'),
(10, 'Suco'),
(11, 'Refrigerante'),
(12, 'Narguilé'),
(13, 'Outros');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbclientes`
--

CREATE TABLE `tbclientes` (
  `cod_cliente` int(11) NOT NULL,
  `nome_cliente` varchar(100) NOT NULL,
  `cod_pedido` int(11) NOT NULL,
  `forma_pagamento` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tbclientes`
--

INSERT INTO `tbclientes` (`cod_cliente`, `nome_cliente`, `cod_pedido`, `forma_pagamento`) VALUES
(1, 'Carlos', 1, 'Débito'),
(2, 'ghghgh', 2, 'Débito');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbfechamentocaixa`
--

CREATE TABLE `tbfechamentocaixa` (
  `data` datetime NOT NULL,
  `valor_total` decimal(19,2) NOT NULL,
  `valor_retirada` decimal(19,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbfuncionarios`
--

CREATE TABLE `tbfuncionarios` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `senha` blob NOT NULL,
  `email` varchar(100) NOT NULL,
  `cpf` char(14) NOT NULL,
  `status_funcionario` varchar(20) NOT NULL,
  `funcao` char(1) NOT NULL,
  `data_nascimento` char(11) NOT NULL,
  `data_contratacao` char(11) NOT NULL,
  `fone` char(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tbfuncionarios`
--

INSERT INTO `tbfuncionarios` (`id`, `nome`, `senha`, `email`, `cpf`, `status_funcionario`, `funcao`, `data_nascimento`, `data_contratacao`, `fone`) VALUES
(89775, 'Veloso', 0xb5f86d4b7dd0e1183405f269df280e4e, 'veloso@gmail.com', '111.111.111-11', 'Ativo', 'A', '0000-00-00', '0000-00-00', '(11) 11111-1111');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbpagamentos`
--

CREATE TABLE `tbpagamentos` (
  `forma_pagamento` varchar(50) NOT NULL,
  `cod_cliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tbpagamentos`
--

INSERT INTO `tbpagamentos` (`forma_pagamento`, `cod_cliente`) VALUES
('Débito', 1),
('Débito', 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbpedidos`
--

CREATE TABLE `tbpedidos` (
  `cod_pedido` int(11) NOT NULL,
  `cod_produto` int(11) NOT NULL,
  `cod_cliente` int(11) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `data_pedido` datetime NOT NULL,
  `preco` decimal(19,2) NOT NULL,
  `descricao` varchar(100) NOT NULL,
  `forma_pagamento` varchar(100) NOT NULL,
  `forma_pagamento_2` varchar(100) NOT NULL,
  `valor_pagamento_1` decimal(19,2) NOT NULL,
  `valor_pagamento_2` decimal(19,2) NOT NULL,
  `valor_total` decimal(19,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tbpedidos`
--

INSERT INTO `tbpedidos` (`cod_pedido`, `cod_produto`, `cod_cliente`, `quantidade`, `data_pedido`, `preco`, `descricao`, `forma_pagamento`, `forma_pagamento_2`, `valor_pagamento_1`, `valor_pagamento_2`, `valor_total`) VALUES
(1, 1, 1, 2, '2022-11-03 23:32:51', '100.00', 'Gelado', 'Débito', 'Dinheiro', '50.00', '150.00', '200.00'),
(2, 1, 2, 8, '2022-11-05 20:40:47', '100.00', 'Gelado', 'Débito', 'Dinheiro', '88.00', '712.00', '800.00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbpreco`
--

CREATE TABLE `tbpreco` (
  `cod_preco` int(11) NOT NULL,
  `cod_produto` int(11) NOT NULL,
  `preco` decimal(19,2) NOT NULL,
  `data_preco` datetime NOT NULL,
  `cod_tipo_preco` int(11) NOT NULL,
  `ativo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tbpreco`
--

INSERT INTO `tbpreco` (`cod_preco`, `cod_produto`, `preco`, `data_preco`, `cod_tipo_preco`, `ativo`) VALUES
(1, 1, '80.00', '2022-11-03 23:27:54', 2, 1),
(2, 1, '100.00', '2022-11-03 23:27:54', 1, 1),
(3, 1, '50.00', '2022-11-03 23:27:54', 3, 1),
(4, 2, '80.00', '2022-11-03 23:28:09', 2, 1),
(5, 2, '100.00', '2022-11-03 23:28:09', 1, 1),
(6, 2, '50.00', '2022-11-03 23:28:09', 3, 1),
(7, 3, '3.00', '2022-11-03 23:28:38', 2, 1),
(8, 3, '4.00', '2022-11-03 23:28:38', 1, 1),
(9, 3, '1.00', '2022-11-03 23:28:38', 3, 1),
(10, 4, '5.00', '2022-11-05 20:39:39', 2, 1),
(11, 4, '7.00', '2022-11-05 20:39:39', 1, 1),
(12, 4, '2.50', '2022-11-05 20:39:39', 3, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbprodutos`
--

CREATE TABLE `tbprodutos` (
  `cod_produto` int(11) NOT NULL,
  `nome_produto` varchar(100) NOT NULL,
  `unidade` int(11) NOT NULL,
  `status_produtos` char(1) NOT NULL,
  `qntd_estoque` int(11) NOT NULL,
  `categoria` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tbprodutos`
--

INSERT INTO `tbprodutos` (`cod_produto`, `nome_produto`, `unidade`, `status_produtos`, `qntd_estoque`, `categoria`) VALUES
(1, 'Jack Daniels Maça verde', -9, 'A', 10, 'Destilado'),
(2, 'Red label', 1, 'A', 10, 'Destilado'),
(3, 'Skol', 250, 'A', 10, 'Cerveja'),
(4, 'brhama', 310, 'A', 100, 'Cerveja');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbsenhas`
--

CREATE TABLE `tbsenhas` (
  `id` int(11) NOT NULL,
  `chaves_criptografadas` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tbsenhas`
--

INSERT INTO `tbsenhas` (`id`, `chaves_criptografadas`) VALUES
(89775, 'NwswbApzA');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbtipopreco`
--

CREATE TABLE `tbtipopreco` (
  `cod_tipo_preco` int(11) NOT NULL,
  `descricao` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tbtipopreco`
--

INSERT INTO `tbtipopreco` (`cod_tipo_preco`, `descricao`) VALUES
(1, 'Gelado'),
(2, 'Quente'),
(3, 'Preço de custo');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `tbcategoria`
--
ALTER TABLE `tbcategoria`
  ADD PRIMARY KEY (`cod_categoria`);

--
-- Índices para tabela `tbclientes`
--
ALTER TABLE `tbclientes`
  ADD PRIMARY KEY (`cod_cliente`);

--
-- Índices para tabela `tbfuncionarios`
--
ALTER TABLE `tbfuncionarios`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `tbpedidos`
--
ALTER TABLE `tbpedidos`
  ADD PRIMARY KEY (`cod_pedido`);

--
-- Índices para tabela `tbpreco`
--
ALTER TABLE `tbpreco`
  ADD PRIMARY KEY (`cod_preco`);

--
-- Índices para tabela `tbprodutos`
--
ALTER TABLE `tbprodutos`
  ADD PRIMARY KEY (`cod_produto`);

--
-- Índices para tabela `tbtipopreco`
--
ALTER TABLE `tbtipopreco`
  ADD PRIMARY KEY (`cod_tipo_preco`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `tbcategoria`
--
ALTER TABLE `tbcategoria`
  MODIFY `cod_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de tabela `tbpreco`
--
ALTER TABLE `tbpreco`
  MODIFY `cod_preco` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de tabela `tbtipopreco`
--
ALTER TABLE `tbtipopreco`
  MODIFY `cod_tipo_preco` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
