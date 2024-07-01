/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author Thành Vinh
 */
public class Paging {

    public Paging() {
    }

    private int nrpp;
    private int start;
    private int size;
    private int pageStart;
    private int pageEnd;

    public Paging(int nrpp, int start, int size) {
        this.nrpp = nrpp;
        this.start = start;
        this.size = size;
    }

    private int totalPage;
    private int begin;
    private int end;

    public int getPageStart() {
        return pageStart;
    }

    public void setPageStart(int pageStart) {
        this.pageStart = pageStart;
    }

    public int getPageEnd() {
        return pageEnd;
    }

    public void setPageEnd(int pageEnd) {
        this.pageEnd = pageEnd;
    }
    
    

    public int getNrpp() {
        return nrpp;
    }

    public void setNrpp(int nrpp) {
        this.nrpp = nrpp;
    }

    public int getStart() {
        return start;
    }

    public void setStart(int start) {
        this.start = start;
    }

    public int getSize() {
        return size;
    }

    public void setSize(int size) {
        this.size = size;
    }

    public int getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    public int getBegin() {
        return begin;
    }

    public void setBegin(int begin) {
        this.begin = begin;
    }

    public int getEnd() {
        return end;
    }

    public void setEnd(int end) {
        this.end = end;
    }

    public void calc() {
        totalPage = (size + nrpp - 1) / nrpp;
        start = start < 0 ? 0 : start;
        start = start >= totalPage ? (totalPage - 1) : start;
        begin = start * nrpp;
        end = begin + nrpp;
        end = end > size ? size : end;
        pageStart = start - 2;
        pageStart = pageStart < 0 ? 0 : pageStart;
        pageStart = start + 2;
        pageEnd = pageEnd > totalPage - 1 ? totalPage - 1 : pageEnd;
    }
}
