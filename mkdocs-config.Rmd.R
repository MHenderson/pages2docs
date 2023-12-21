```{r index_md, eval=FALSE}
library(fs)

file_copy("index.md", "docs/index.md")
```

## Create mkdocs config

```{r mkdocs_yml, eval=FALSE}
library(ymlthis)

yml_blank() %>%
  yml_toplevel(site_name = "pages") %>%
  yml_toplevel(docs_dir = "docs") %>%
  yml_toplevel(dev_addr = "127.0.0.1:8001") %>%
  yml_toplevel(
    list(
      theme = list(
        name = "material",
        palette = list(
          primary = "blue grey",
          accent = "indigo"
        )
      )
    )) %>%
  yml_toplevel(list(nav = map(11:19, g))) %>%
  as_yml() %>%
  use_yml_file(path = "mkdocs.yml")
```