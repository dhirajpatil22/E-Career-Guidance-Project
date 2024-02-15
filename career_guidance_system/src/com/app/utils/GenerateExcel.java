package com.app.utils;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.app.pojos.Student;

public class GenerateExcel 
{
	public void writeExcel(List<Student> listBook, String excelFilePath) throws IOException 
	{
		Workbook workbook = getWorkbook(excelFilePath);
		Sheet sheet = workbook.createSheet();
		
		int rowCount = 0;
		
		for (Student aBook : listBook) 
		{
			Row row = sheet.createRow(++rowCount);
			writeBook(aBook, row);
		}
		
		try (FileOutputStream outputStream = new FileOutputStream(excelFilePath)) 
		{
			workbook.write(outputStream);
		}		
	}
	
	private void writeBook(Student aBook, Row row) 
	{
		Cell cell = row.createCell(1);
		cell.setCellValue(aBook.getEmail());

		cell = row.createCell(2);
		cell.setCellValue(aBook.getCity());
		
		cell = row.createCell(3);
		cell.setCellValue(aBook.getDob());
	}
	
	
	
	private Workbook getWorkbook(String excelFilePath) throws IOException 
	{
		Workbook workbook = null;
		
		if (excelFilePath.endsWith("xlsx")) 
		{
			workbook = new XSSFWorkbook();
		} 
		else if (excelFilePath.endsWith("xls")) 
		{
			workbook = new HSSFWorkbook();
		} 
		else 
		{
			throw new IllegalArgumentException("The specified file is not Excel file");
		}
		return workbook;
	}
}
