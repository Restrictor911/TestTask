package by.restrictor.testtask.model;

public class Paginator {
    private int currentPage = 0;
    private int maxPage = 0;
    private String mode = "main";

    public Paginator(int pages) {
        this.maxPage = pages;
    }

    public String getMode() {
        return mode;
    }

    public void setMode(String mode) {
        this.mode = mode;
    }

    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    public int getMaxPage() {
        return maxPage;
    }

    public void setMaxPage(int maxPage) {
        this.maxPage = maxPage;
    }
}
