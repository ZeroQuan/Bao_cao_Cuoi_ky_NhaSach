using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace NhaSach.Web.Migrations
{
    /// <inheritdoc />
    public partial class Db_Cleanup_And_Fixes : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder mb)
        {
            // Xoá Roles nếu còn
            mb.Sql(@"IF OBJECT_ID(N'dbo.AspNetUserRoles','U')  IS NOT NULL DROP TABLE dbo.AspNetUserRoles;");
            mb.Sql(@"IF OBJECT_ID(N'dbo.AspNetRoleClaims','U') IS NOT NULL DROP TABLE dbo.AspNetRoleClaims;");
            mb.Sql(@"IF OBJECT_ID(N'dbo.AspNetRoles','U')      IS NOT NULL DROP TABLE dbo.AspNetRoles;");

            // (tuỳ chọn) nếu không dùng login ngoài/claims/tokens:
            // mb.Sql(@"IF OBJECT_ID(N'dbo.AspNetUserLogins','U') IS NOT NULL DROP TABLE dbo.AspNetUserLogins;");
            // mb.Sql(@"IF OBJECT_ID(N'dbo.AspNetUserClaims','U') IS NOT NULL DROP TABLE dbo.AspNetUserClaims;");
            // mb.Sql(@"IF OBJECT_ID(N'dbo.AspNetUserTokens','U') IS NOT NULL DROP TABLE dbo.AspNetUserTokens;");

            // Xoá bảng ảnh sản phẩm nếu còn
            mb.Sql(@"IF OBJECT_ID(N'dbo.Sanpham_Anh','U') IS NOT NULL DROP TABLE dbo.Sanpham_Anh;");

            // Dọn shadow cột ở Baiviet_Tag
            mb.Sql(@"
            DECLARE @sql nvarchar(max);

            -- 1) Drop FOREIGN KEYs tham chiếu tới 2 cột
            SET @sql = N'';
            SELECT @sql = @sql + N'ALTER TABLE ' + QUOTENAME(SCHEMA_NAME(fk.schema_id)) + N'.' + QUOTENAME(OBJECT_NAME(fk.parent_object_id))
                + N' DROP CONSTRAINT ' + QUOTENAME(fk.name) + N';' + CHAR(13)
            FROM sys.foreign_keys fk
            JOIN sys.foreign_key_columns fkc ON fk.object_id=fkc.constraint_object_id
            JOIN sys.columns c ON c.object_id=fkc.parent_object_id AND c.column_id=fkc.parent_column_id
            WHERE fk.parent_object_id = OBJECT_ID(N'dbo.Baiviet_Tag')
            AND c.name IN (N'Baiviet_Id1', N'Tag_Id1');
            IF (@sql <> N'') EXEC sp_executesql @sql;

            -- 2) Drop INDEXes trên 2 cột
            SET @sql = N'';
            SELECT @sql = @sql + N'DROP INDEX ' + QUOTENAME(i.name) + N' ON ' 
                + QUOTENAME(OBJECT_SCHEMA_NAME(i.object_id)) + N'.' + QUOTENAME(OBJECT_NAME(i.object_id)) + N';' + CHAR(13)
            FROM sys.indexes i
            JOIN sys.index_columns ic ON i.object_id=ic.object_id AND i.index_id=ic.index_id
            JOIN sys.columns c ON c.object_id=ic.object_id AND c.column_id=ic.column_id
            WHERE i.object_id = OBJECT_ID(N'dbo.Baiviet_Tag')
            AND c.name IN (N'Baiviet_Id1', N'Tag_Id1')
            AND i.name IS NOT NULL
            AND i.is_hypothetical = 0;
            IF (@sql <> N'') EXEC sp_executesql @sql;

            -- 3) Drop default constraints (nếu có) trên 2 cột
            SET @sql = N'';
            SELECT @sql = @sql + N'ALTER TABLE ' + QUOTENAME(OBJECT_SCHEMA_NAME(dc.parent_object_id)) + N'.' + QUOTENAME(OBJECT_NAME(dc.parent_object_id))
                + N' DROP CONSTRAINT ' + QUOTENAME(dc.name) + N';' + CHAR(13)
            FROM sys.default_constraints dc
            JOIN sys.columns c ON c.object_id=dc.parent_object_id AND c.column_id=dc.parent_column_id
            WHERE dc.parent_object_id = OBJECT_ID(N'dbo.Baiviet_Tag')
            AND c.name IN (N'Baiviet_Id1', N'Tag_Id1');
            IF (@sql <> N'') EXEC sp_executesql @sql;

            -- 4) Drop cột
            IF COL_LENGTH('dbo.Baiviet_Tag','Baiviet_Id1') IS NOT NULL
                ALTER TABLE dbo.Baiviet_Tag DROP COLUMN Baiviet_Id1;
            IF COL_LENGTH('dbo.Baiviet_Tag','Tag_Id1') IS NOT NULL
                ALTER TABLE dbo.Baiviet_Tag DROP COLUMN Tag_Id1;

            -- 5) Đảm bảo FKs chuẩn theo Baiviet_Id / Tag_Id
            IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = N'FK_Baiviet_Tag_Baiviet')
            BEGIN
                ALTER TABLE dbo.Baiviet_Tag WITH CHECK
                ADD CONSTRAINT FK_Baiviet_Tag_Baiviet
                    FOREIGN KEY (Baiviet_Id) REFERENCES dbo.Baiviet(Baiviet_Id) ON DELETE CASCADE;
            END;
            IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = N'FK_Baiviet_Tag_Tag')
            BEGIN
                ALTER TABLE dbo.Baiviet_Tag WITH CHECK
                ADD CONSTRAINT FK_Baiviet_Tag_Tag
                    FOREIGN KEY (Tag_Id) REFERENCES dbo.Tag(Tag_Id) ON DELETE CASCADE;
            END;
            ");

            // Dọn shadow cột ở Giohang_Item
            mb.Sql(@"
            DECLARE @sql2 nvarchar(max);

            -- 1) Drop FKs tham chiếu Sanpham_Id1
            SET @sql2 = N'';
            SELECT @sql2 = @sql2 + N'ALTER TABLE ' + QUOTENAME(SCHEMA_NAME(fk.schema_id)) + N'.' + QUOTENAME(OBJECT_NAME(fk.parent_object_id))
                + N' DROP CONSTRAINT ' + QUOTENAME(fk.name) + N';' + CHAR(13)
            FROM sys.foreign_keys fk
            JOIN sys.foreign_key_columns fkc ON fk.object_id=fkc.constraint_object_id
            JOIN sys.columns c ON c.object_id=fkc.parent_object_id AND c.column_id=fkc.parent_column_id
            WHERE fk.parent_object_id = OBJECT_ID(N'dbo.Giohang_Item')
            AND c.name = N'Sanpham_Id1';
            IF (@sql2 <> N'') EXEC sp_executesql @sql2;

            -- 2) Drop INDEXes trên Sanpham_Id1
            SET @sql2 = N'';
            SELECT @sql2 = @sql2 + N'DROP INDEX ' + QUOTENAME(i.name) + N' ON ' 
                + QUOTENAME(OBJECT_SCHEMA_NAME(i.object_id)) + N'.' + QUOTENAME(OBJECT_NAME(i.object_id)) + N';' + CHAR(13)
            FROM sys.indexes i
            JOIN sys.index_columns ic ON i.object_id=ic.object_id AND i.index_id=ic.index_id
            JOIN sys.columns c ON c.object_id=ic.object_id AND c.column_id=ic.column_id
            WHERE i.object_id = OBJECT_ID(N'dbo.Giohang_Item')
            AND c.name = N'Sanpham_Id1'
            AND i.name IS NOT NULL
            AND i.is_hypothetical = 0;
            IF (@sql2 <> N'') EXEC sp_executesql @sql2;

            -- 3) Drop default constraints (nếu có)
            SET @sql2 = N'';
            SELECT @sql2 = @sql2 + N'ALTER TABLE ' + QUOTENAME(OBJECT_SCHEMA_NAME(dc.parent_object_id)) + N'.' + QUOTENAME(OBJECT_NAME(dc.parent_object_id))
                + N' DROP CONSTRAINT ' + QUOTENAME(dc.name) + N';' + CHAR(13)
            FROM sys.default_constraints dc
            JOIN sys.columns c ON c.object_id=dc.parent_object_id AND c.column_id=dc.parent_column_id
            WHERE dc.parent_object_id = OBJECT_ID(N'dbo.Giohang_Item')
            AND c.name = N'Sanpham_Id1';
            IF (@sql2 <> N'') EXEC sp_executesql @sql2;

            -- 4) Drop cột
            IF COL_LENGTH('dbo.Giohang_Item','Sanpham_Id1') IS NOT NULL
                ALTER TABLE dbo.Giohang_Item DROP COLUMN Sanpham_Id1;

            -- 5) Đảm bảo FK & unique index đúng
            IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name=N'FK_Giohang_Item_Sanpham')
            BEGIN
                ALTER TABLE dbo.Giohang_Item WITH CHECK
                ADD CONSTRAINT FK_Giohang_Item_Sanpham
                    FOREIGN KEY (Sanpham_Id) REFERENCES dbo.Sanpham(Sanpham_Id) ON DELETE NO ACTION;
            END;

            IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name=N'UX_Giohang_Session_Sanpham' AND object_id=OBJECT_ID(N'dbo.Giohang_Item'))
                CREATE UNIQUE INDEX UX_Giohang_Session_Sanpham ON dbo.Giohang_Item(Session_Id, Sanpham_Id);
            ");

            // Đảm bảo FK & unique index cho giỏ hàng
            mb.Sql(@"
            IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name=N'FK_Giohang_Item_Sanpham')
                ALTER TABLE [dbo].[Giohang_Item] WITH CHECK
                ADD CONSTRAINT [FK_Giohang_Item_Sanpham]
                    FOREIGN KEY([Sanpham_Id]) REFERENCES [dbo].[Sanpham]([Sanpham_Id]) ON DELETE NO ACTION;
            ");
                        mb.Sql(@"
            IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name=N'UX_Giohang_Session_Sanpham' AND object_id=OBJECT_ID(N'dbo.Giohang_Item'))
                CREATE UNIQUE INDEX [UX_Giohang_Session_Sanpham] ON [dbo].[Giohang_Item]([Session_Id],[Sanpham_Id]);
            ");

        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder mb)
        {

        }
    }
}
