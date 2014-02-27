-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Create PROCEDURE [dbo].[SaveEmployee]
	-- Add the parameters for the stored procedure here
	(
	@EmpId int,
	@MID nvarchar(50),
	@Name nvarchar(50),
	@Competency nvarchar(50),
	@Location nvarchar(50),
	@Vertical nvarchar(50),
	@CustomerName nvarchar(50),
	@ProjectName nvarchar(50),
	@DeliveryManager nvarchar(50),
	@AccountCategory nvarchar(50),
	@IsActive int
	)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.


    -- Insert statements for procedure here
	INSERT into TblEmployee values(@EmpId,@MID,@Name,@Competency,@Location,@Vertical,@CustomerName,@ProjectName,@DeliveryManager,@AccountCategory,@IsActive);
END
